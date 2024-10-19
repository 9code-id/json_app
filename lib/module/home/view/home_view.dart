import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import 'package:json_app/state_util.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;
    return RefreshIndicator(
      onRefresh: () => controller.reloadUserData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Contacts"),
          actions: const [],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextField(
                validator: Validator.required,
                value: null,
                hint: "Search your contact list..",
                suffixIcon: Icons.search,
                onChanged: (value) {
                  controller.updateSearch(value);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: UserService.users.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = UserService.users[index];

                    var name2DigitChar = item.firstName![0].toUpperCase() +
                        (item.lastName == null
                            ? ""
                            : item.lastName![0].toUpperCase());

                    bool isMe = item.id == AuthService().userId;
                    String firstCharacter = item.firstName![0].toUpperCase();

                    bool isShown = false;
                    if (index == 0) {
                      isShown = true;
                    } else if (index < UserService.users.length - 1) {
                      var prevItem = UserService.users[index - 1];
                      var nextFirstCharacter =
                          prevItem.firstName![0].toUpperCase();
                      if (firstCharacter != nextFirstCharacter) {
                        isShown = true;
                      }
                    }
                    if (controller.search.isNotEmpty) {
                      if (!item.firstName!
                              .toLowerCase()
                              .contains(controller.search.toLowerCase()) &&
                          !item.lastName!
                              .toLowerCase()
                              .contains(controller.search.toLowerCase())) {
                        return const SizedBox();
                      }
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isShown) ...[
                          Text(
                            firstCharacter,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const Divider(),
                        ],
                        InkWell(
                          onTap: () async {
                            await Get.to(ContactDetailView(
                              item: item,
                            ));
                            controller.reload();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 12.0,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 24.0,
                                  child: Text(
                                    name2DigitChar,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "${item.firstName} ${item.lastName}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                if (isMe)
                                  Text(
                                    " (you)",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: disabledColor,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(const ContactFormView());
          },
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
