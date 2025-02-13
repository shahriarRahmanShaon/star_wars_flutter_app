import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({super.key, required this.vmBuilder, required this.builder});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.vmBuilder(context),
      child: Consumer<T>(
        builder: (context, viewModel, child) => _buildScreenContent(context, viewModel),
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context, T viewModel) {
    if (!viewModel.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Stack(
      children: [
        widget.builder(context, viewModel),
        if (viewModel.isLoading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
