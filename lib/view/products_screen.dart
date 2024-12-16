import 'package:flutter/material.dart';
import 'package:homework_11_2/services/product_services.dart';
import 'package:shimmer/shimmer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade300,
      ),
      body: FutureBuilder(
        future: getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amber.shade100,
                      elevation: 2,
                      child: ListTile(
                        leading: Image.network(snapshot.data![index].thumbnail),
                        title: Text(
                          snapshot.data![index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].description,
                              style: const TextStyle(fontSize: 10),
                            ),
                            Text(
                              snapshot.data![index].rating.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 50,
                          height: 30,
                          alignment: const Alignment(0, 0),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(snapshot.data![index].price.toString()),
                        ),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("check your internet connection"),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.amber.shade200,
              highlightColor: Colors.amber.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 500,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
