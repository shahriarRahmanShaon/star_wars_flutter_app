import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/base/theme/theme_provider.dart';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({super.key, required this.vmBuilder, required this.builder});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.vmBuilder(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: (context, viewModel, child) {
          if (!viewModel.isInitialized) {
            return Scaffold(
              backgroundColor: isDarkMode ? Colors.black87 : Colors.white70,
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            backgroundColor: isDarkMode ? Colors.black87 : Colors.white70,
            body: Stack(
              children: [
                widget.builder(context, viewModel),
                if (viewModel.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
