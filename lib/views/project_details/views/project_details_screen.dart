import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/const/resource.dart';
import 'package:kanban_board/cubit/section_cubit.dart';
import 'package:kanban_board/models/project_model.dart';
import 'package:kanban_board/repositories/section_repository.dart';
import 'package:kanban_board/utils/extensions.dart';
import 'package:kanban_board/views/project_details/views/components/task_list_components.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    required this.projectId,
    required this.project,
    super.key,
  });

  final String projectId;
  final Project project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    // Initialize the TabController with a length of 0 first
    _tabController = TabController(length: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionCubit(SectionRepository())
        ..fetchSectionsForProject(widget.projectId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Project Sections'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E7FF),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFE0E7FF),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE0E7FF),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4F46E5),
                            // Color(0xFFE0E7FF),
                            Colors.blue,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  20.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name ?? 'Unnamed Project',
                        // style: context.,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      5.height,
                      // Text('Project Description',
                      // style: context.textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<SectionCubit, SectionState>(
                  builder: (context, state) {
                    if (state is SectionLoading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          20.height,
                          const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (state is SectionsLoaded) {
                      if (state.sections.isEmpty) {
                        return InkWell(
                          onTap: () =>
                              context.read<SectionCubit>().showAddSectionUi(
                                    context,
                                    project: widget.project,
                                  ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 20.height,
                              Image.asset(R.ASSETS_NO_TASK_ICON_PNG),
                              20.height,
                              Text(
                                'No sections found for this project',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      }

                      // Update the TabController length dynamically based on the sections length
                      _tabController = TabController(
                        length: state.sections.length,
                        vsync: this,
                      );
                      return Column(
                        children: [
                          // TabBar for sections
                          Row(
                            children: [
                              TabBar(
                                controller: _tabController,
                                isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  ...state.sections.map((section) {
                                    return Tab(
                                      text: section?.name ?? 'Unnamed Section',
                                    );
                                  }),
                                  // const Tab(
                                  //   icon: Icon(Icons.add),
                                  // ), // Add button as a tab
                                ],
                              ),
                              20.width,
                              MaterialButton(
                                onPressed: () {
                                  context.read<SectionCubit>().showAddSectionUi(
                                        context,
                                        project: widget.project,
                                      );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                color: const Color(0xFF4F46E5),
                                minWidth: 40,
                                padding: EdgeInsets.zero,
                                height: 40,
                                child: const Icon(Icons.add),
                              ), // Add button as a tab
                            ],
                          ),
                          20.height,
                          // IndexedStack to show the details of the selected section
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                ...state.sections.map((section) {
                                  if (section == null) {
                                    return const Center(
                                      child: Text('Error loading section'),
                                    );
                                  }
                                  return TaskListComponent(
                                    section: section,
                                    project: widget.project,
                                  );
                                  // return ListTile(
                                  //   title:
                                  //       Text(section.name ?? 'Unnamed Section'),
                                  //   subtitle: Text(
                                  //     'Order: ${section.order ?? 'N/A'}',
                                  //   ),
                                  // );
                                }),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if (state is SectionError) {
                      return Text('Error: ${state.error}');
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
