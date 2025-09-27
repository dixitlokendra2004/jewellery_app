import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/search_page/search_pageviewmodel.dart';
import 'package:jewellery_app/ui/shopping_jewellery/shopping_jewellery_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/textfield_widget.dart';
import 'package:stacked/stacked.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<String> items = ['Necklace', 'Ring', 'Bracelet', 'Earrings'];
  List<String> filteredItems = [];
  List<String> recentSearches = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterItems(String query) {
    List<String> filteredList = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredItems = filteredList;
    });
  }

  void handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        if (!recentSearches.contains(query)) {
          recentSearches.add(query);
        }
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShoppingJewelleryPage(query: query),
        ),
      );
    }
  }

  void removeRecentSearch(String search) {
    setState(() {
      recentSearches.remove(search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchPageViewModel>.reactive(
      viewModelBuilder: () => SearchPageViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child:
            AppbarWidget(appbarColor: Colors.white, showBackButton: true),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextfieldWidget(
                  labelText: AppTextString.search,
                  controller: searchController,
                  searchIcon: true,
                  clearIcon: true,
                  onChanged: (value) {
                    filterItems(value);
                  },
                  onSubmitted: (value) {
                    handleSearch(value);
                  },
                ),
                if (recentSearches.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const Text(
                        'Recent Searches',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: recentSearches.map((search) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  searchController.text = search;
                                  filterItems(search);
                                  handleSearch(search);
                                },
                                child: Text(search),
                              ),
                              IconButton(
                                icon: const Icon(Icons.clear, size: 16),
                                onPressed: () => removeRecentSearch(search),
                              ),
                            ],
                          ),
                        )).toList(),
                      ),
                      // const Divider(),
                    ],
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredItems[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
