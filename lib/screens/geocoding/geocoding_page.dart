import 'package:auto_route/auto_route.dart';
import 'package:collect_data/screens/geocoding/bloc/geocoding_bloc.dart';
import 'package:collect_data/utils/collection_utils.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeocodingPage extends StatefulWidget implements AutoRouteWrapper {
  final String search;

  const GeocodingPage({Key? key, required this.search}) : super(key: key);

  @override
  State<GeocodingPage> createState() => _GeocodingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GeocodingBloc(),
      child: this,
    );
  }
}

class _GeocodingPageState extends State<GeocodingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.search.isNotEmpty) {
        BlocProvider.of<GeocodingBloc>(context)
            .add(GeocodingSearchEvent(widget.search));
      }
    });
  }

  void _onFieldSubmitted(String q) {
    BlocProvider.of<GeocodingBloc>(context).add(GeocodingSearchEvent(q));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: context.viewPadding.top + 15,
            ),
            child: Container(
              height: 50,
              width: context.screenWidth - 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.search,
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm...",
                        hintStyle: context.textTheme.bodyMedium,
                        suffixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                      onFieldSubmitted: _onFieldSubmitted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: BlocBuilder<GeocodingBloc, GeocodingState>(
            bloc: BlocProvider.of<GeocodingBloc>(context),
            builder: (_, state) {
              if (state.loading) {
                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                );
              }
              if (state.error.isNotEmpty) {
                return Center(
                  child: Text(state.error),
                );
              }

              return ListView.separated(
                itemBuilder: (_, index) {
                  final geocoding = state.geocodings[index];
                  return ListTile(
                    title: Text(geocoding.name ?? ""),
                    subtitle: Text(
                      [
                        geocoding.communeName,
                        geocoding.districtName,
                        geocoding.provinceName
                      ].joinString(),
                    ),
                    leading: const Icon(Icons.location_on_outlined),
                    onTap: () {
                      context.router.pop(geocoding);
                    },
                  );
                },
                separatorBuilder: (_, index) => const Divider(
                  height: 1,
                ),
                itemCount: state.geocodings.length,
              );
            },
          ))
        ],
      ),
    );
  }
}
