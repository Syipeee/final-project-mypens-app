import 'package:flutter/material.dart';
import 'package:mypens/common/data/dto/api_response.dart';

class ApiResponseLoader<T> extends StatelessWidget {
  final ApiResponse<T> apiResponse;
  final void Function() onRefresh;
  final Widget Function(T) childBuilder;

  const ApiResponseLoader({
    required this.apiResponse,
    required this.onRefresh,
    required this.childBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (apiResponse){
      case ApiResponseSucceed():
        return childBuilder((apiResponse as ApiResponseSucceed).data);
      case ApiResponseLoading():
        return const CircularProgressIndicator();
      case ApiResponseFailed():
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline , size: 36,),

            const SizedBox(height: 6,),

            OutlinedButton(onPressed: onRefresh, child: const Text("Refresh")),
          ],
        );
    }
  }
}
