import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/apparel_page/apparel_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';

import 'category_page_viewmodel.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryPageViewModel>.reactive(
      viewModelBuilder: () => CategoryPageViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppbarWidget(
              textcolor: Colors.black,
              appbarColor: Colors.white,
              showSearchIcon: true,
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        indicatorColor: Colors.brown,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.brown,
                        tabs: [
                          Tab(text: AppTextString.womenText),
                          Tab(text: AppTextString.man),
                          Tab(text: AppTextString.uniSex),
                        ],
                        onTap: (index) {
                          setState(() {
                            _currentTabIndex = index;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // WOMEN tab content
                          ListView.builder(
                            padding: EdgeInsets.only(top: 16),
                            itemCount: viewModel.categoriesList.length,
                            itemBuilder: (context, index) {
                              return ExpandableListTile(
                                title: viewModel.categoriesList[index].categoryName,
                                subtopics: viewModel.subtopicsArray[index],
                                isExpanded: _currentTabIndex == 0 &&
                                    viewModel.expandedIndexesWomen[index] != null,
                                onTap: () {
                                  setState(() {
                                    if (viewModel.expandedIndexesWomen[index] != null) {
                                      viewModel.expandedIndexesWomen[index] = null;
                                    } else {
                                      _collapseAllExcept(
                                          index, viewModel.expandedIndexesWomen);
                                      viewModel.expandedIndexesWomen[index] = index;
                                    }
                                  });
                                },
                              );
                            },
                          ),
                          // MEN tab content
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 16),
                            itemCount: viewModel.categoriesList.length,
                            itemBuilder: (context, index) {
                              return ExpandableListTile(
                                title: viewModel.categoriesList[index].categoryName,
                                subtopics: viewModel.subtopicsArray[index],
                                isExpanded: _currentTabIndex == 1 &&
                                    viewModel.expandedIndexesMen[index] != null,
                                onTap: () {
                                  setState(() {
                                    if (viewModel.expandedIndexesMen[index] != null) {
                                      viewModel.expandedIndexesMen[index] = null;
                                    } else {
                                      _collapseAllExcept(
                                          index, viewModel.expandedIndexesMen);
                                      viewModel.expandedIndexesMen[index] = index;
                                    }
                                  });
                                },
                              );
                            },
                          ),
                          // UNISEX tab content
                          ListView.builder(
                            padding: EdgeInsets.only(top: 16),
                            itemCount: viewModel.categoriesList.length,
                            itemBuilder: (context, index) {
                              return ExpandableListTile(
                                title: viewModel.categoriesList[index].categoryName,
                                subtopics: viewModel.subtopicsArray[index],
                                isExpanded: _currentTabIndex == 2 &&
                                    viewModel.expandedIndexesUnisex[index] != null,
                                onTap: () {
                                  setState(() {
                                    if (viewModel.expandedIndexesUnisex[index] != null) {
                                      viewModel.expandedIndexesUnisex[index] = null;
                                    } else {
                                      _collapseAllExcept(
                                          index, viewModel.expandedIndexesUnisex);
                                      viewModel.expandedIndexesUnisex[index] = index;
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _collapseAllExcept(int currentIndex, List<int?> expansionList) {
    for (int i = 0; i < expansionList.length; i++) {
      if (i != currentIndex && i < expansionList.length) {
        if (expansionList[i] != null) {
          expansionList[i] = null;
        }
      }
    }
  }
}

class ExpandableListTile extends StatelessWidget {
  final String title;
  final List<String> subtopics;
  final bool isExpanded;
  final VoidCallback onTap;

  ExpandableListTile({
    required this.title,
    required this.subtopics,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        canvasColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: AppTextStyle.getTextStyle15FontWeight400black,
        ),
        children: isExpanded
            ? subtopics.map((subtopic) {
          return ListTile(
            title: Text(
              subtopic,
              style: AppTextStyle.getTextStyle12FontWeightblack,
            ),
            onTap: onTap,
          );
        }).toList()
            : [],
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          onTap();
        },
      ),
    );
  }
}
