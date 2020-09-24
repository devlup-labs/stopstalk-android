import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class SearchProblemsScreen extends StatefulWidget {
  SearchProblemsScreen({Key key}) : super(key: key);
  static const routeName = '/search-problems';

  @override
  _SearchProblemsScreenState createState() => _SearchProblemsScreenState();
}

class _SearchProblemsScreenState extends State<SearchProblemsScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem> sites = new List();
  final List<DropdownMenuItem> sortBy = new List();
  final List<DropdownMenuItem> problemTags = new List();

  String selectedSortBy = "accasc";
  String selectedSite = "CodeChef";
  String selectedProblemTagDropdown = "dummy1";
  String selectedProblemTagTextbox = "";

  bool onlyShowProblemsWithEditorials = false;
  bool excludeMySolvedProblems = false;

  @override
  void initState() {
    super.initState();
    _initSites();
    _initSortBy();
    _initProblemTags();
  }

  void _initSites() {
    sites.addAll([
      DropdownMenuItem(
          value: "CodeChef", child: Text("CodeChef"), key: Key("CodeChef")),
      DropdownMenuItem(
          value: "CodeForces",
          child: Text("CodeForces"),
          key: Key("CodeForces")),
      DropdownMenuItem(value: "SPOJ", child: Text("SPOJ"), key: Key("SPOJ")),
      DropdownMenuItem(
          value: "AtCoder", child: Text("AtCoder"), key: Key("AtCoder")),
      DropdownMenuItem(
          value: "HackerEarth",
          child: Text("HackerEarth"),
          key: Key("HackerEarth")),
      DropdownMenuItem(
          value: "HackerRank",
          child: Text("HackerRank"),
          key: Key("HackerRank")),
      DropdownMenuItem(value: "UVa", child: Text("UVa"), key: Key("UVa")),
      DropdownMenuItem(value: "Timus", child: Text("Timus"), key: Key("Timus")),
    ]);
  }

  void _initSortBy() {
    sortBy.addAll([
      DropdownMenuItem(
          value: "accasc",
          child: Text("Accuracy (Ascending)"),
          key: Key("accasc")),
      DropdownMenuItem(
          value: "accdesc",
          child: Text("Accuracy (Descending)"),
          key: Key("accdesc")),
      DropdownMenuItem(
          value: "solcntasc",
          child: Text("Solved Count (Ascending)"),
          key: Key("solcntasc")),
      DropdownMenuItem(
          value: "solcntdesc",
          child: Text("Solved Count (Descending)"),
          key: Key("solcntdesc")),
    ]);
  }

  void _initProblemTags() {
    problemTags.addAll([
      DropdownMenuItem(
          value: "dummy1", child: Text("dummy"), key: Key("dummy1")),
      DropdownMenuItem(
          value: "dummy2", child: Text("dummy"), key: Key("dummy2")),
      DropdownMenuItem(
          value: "dummy3", child: Text("dummy"), key: Key("dummy3")),
      DropdownMenuItem(
          value: "dummy4", child: Text("dummy"), key: Key("dummy4")),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Problems',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Problem Name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    items: sites,
                    value: selectedSite,
                    onChanged: (value) {
                      selectedSite = value;
                      setState(() {});
                    },
                    hint: Text("Site"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    items: sortBy,
                    value: selectedSortBy,
                    onChanged: (value) {
                      selectedSortBy = value;
                      setState(() {});
                    },
                    hint: Text("Site"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Search Site Tags"),
                    onChanged: (value) {
                      selectedProblemTagTextbox = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("OR"),
                  DropdownButton(
                    items: problemTags,
                    value: selectedProblemTagDropdown,
                    onChanged: (value) {
                      selectedProblemTagDropdown = value;
                      setState(() {});
                    },
                    hint: Text("Generalized StopStalk Tags"),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: onlyShowProblemsWithEditorials,
                      onChanged: (value) {
                        onlyShowProblemsWithEditorials = value;
                        setState(() {});
                      },
                    ),
                    title: InkWell(
                        onTap: () {
                          onlyShowProblemsWithEditorials =
                              !onlyShowProblemsWithEditorials;
                          setState(() {});
                        },
                        child: Text("Only show problems with Editorials")),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: excludeMySolvedProblems,
                      onChanged: (value) {
                        excludeMySolvedProblems = value;
                        setState(() {});
                      },
                    ),
                    title: Text("Exclude my Solved Problems"),
                  )
                ])),
      ),
    );
  }
}
