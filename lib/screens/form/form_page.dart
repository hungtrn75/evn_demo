import 'dart:async';
import 'dart:ui';

import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  static const double _minHeight = 120;
  static final _maxHeight = 800.0;

  Offset _offset = const Offset(0, _minHeight);
  bool _isOpen = false;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: 100,
                            itemBuilder: (_, index) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Element at index($index)"),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(backgroundColor: Color(0xFFF6F6F6), elevation: 0),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: FlatButton(
              onPressed: _handleClick,
              splashColor: Colors.transparent,
              textColor: Colors.grey,
              child: Text(_isOpen ? "Back" : ""),
            ),
          ),
          Align(
              child: TextButton(
            child: Text("Suni"),
            onPressed: _showBottomSheet,
          )),
          GestureDetector(
            onPanUpdate: (details) {
              _offset = Offset(0, _offset.dy - details.delta.dy);
              if (_offset.dy < _FormPageState._minHeight) {
                _offset = const Offset(0, _FormPageState._minHeight);
              } else if (_offset.dy > _FormPageState._maxHeight) {
                _offset = Offset(0, _FormPageState._maxHeight);
              }
              setState(() {});
            },
            onPanEnd: (details) => _handleClick(),
            child: AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7)
                  ]),
              child: Column(
                children: [
                  SizedBox(child: Divider(), width: 70,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("3 phút (1km)"),
                      Text("Đây là tuyến đường nhanh nhất")
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            color: Colors.red,
                          ),
                          Container(
                            height: 100,
                            color: Colors.green,
                          ),
                          Container(
                            height: 100,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 100,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 100,
                            color: Colors.green,
                          ),
                          Container(
                            height: 100,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 100,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 100,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 100,
                            color: Colors.green,
                          ),
                          Container(
                            height: 100,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // first it opens the sheet and when called again it closes.
  void _handleClick() {
    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (_offset.dy < _maxHeight / 4) {
        double value = _offset.dy - 10; // we decrement the height by 10 here
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = const Offset(
              0, _minHeight); // makes sure it doesn't go beyond minHeight
          timer.cancel();
        }
      } else if (_offset.dy > _maxHeight / 4 && _offset.dy < _maxHeight / 2) {
        double value = _offset.dy +
            10; // we increment the height of the Container by 10 every 5ms
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight / 2) {
          _offset = Offset(
              0, _maxHeight / 2); // makes sure it does't go above maxHeight
          timer.cancel();
        }
      } else if (_offset.dy > _maxHeight / 2 &&
          _offset.dy < _maxHeight * 0.75) {
        double value = _offset.dy - 10; // we decrement the height by 10 here
        _offset = Offset(0, value);
        if (_offset.dy < _maxHeight / 2) {
          _offset = Offset(
              0, _maxHeight / 2); // makes sure it doesn't go beyond minHeight
          timer.cancel();
        }
      } else {

        double value = _offset.dy +
            10; // we increment the height of the Container by 10 every 5ms
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset =
              Offset(0, _maxHeight); // makes sure it does't go above maxHeight
          timer.cancel();
        }
      }

      setState(() {});
    });
  }
}
