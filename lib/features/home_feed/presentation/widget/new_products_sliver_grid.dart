import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobox/core/bloc/product_bloc/product_bloc.dart';
import 'package:mobox/core/widget/no_data.dart';
import 'package:mobox/core/widget/product_cart.dart';
class NewProductSliverGrid extends StatefulWidget {
  @override
  _NewProductSliverGridState createState() => _NewProductSliverGridState();
}

class _NewProductSliverGridState extends State<NewProductSliverGrid> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductDataLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((_, int index) {
              return ProductCart(product: state.productList[index]);
            }),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 16,
            ),
          );
        } else if (state is ProductLoadFailure) {

          return SliverGrid(
            delegate: SliverChildBuilderDelegate((_, int index) {

              return ProductCart(product: state.productList[index]);
            }),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 16,
            ),
          );
        } else if (state is ProductNoData) {
          return SliverToBoxAdapter(
            child: NoData(
              title: 'New from stores you follow',
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
