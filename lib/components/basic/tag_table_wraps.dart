import 'package:flutter/material.dart';
import '../../models/models.dart';

// clip
class ClipBoxWidget extends StatefulWidget {
  @override
  _ClipBoxWidgetState createState() => _ClipBoxWidgetState();
}

class _ClipBoxWidgetState extends State<ClipBoxWidget> {
  List<String> _tagList = ['apple', 'banana', 'orange'];
  String _actionTag = '';
  List<String> _selectlist = [];

  String _tagText = 'apple';

  int _sortColumnIndex;
  bool _sortColumnFlat = true;
  // 基础标签
  Widget get _WrapDemo {
    return Wrap(
      spacing: 8,
      children: <Widget>[
        Chip(
          label: Text('标签1'),
          avatar: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(
              '啦啦',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Chip(
          label: Text('标签2'),
          backgroundColor: Colors.lightBlue,
          avatar: CircleAvatar(
            backgroundImage: AssetImage('images/1.jpg'),
          ),
        ),
        // 带删除按钮的Clip
        Chip(
          label: Text('这是个带删除的标签'),
          onDeleted: () {},
          // deleteIcon: Icon(Icons.delete),
          // deleteIconColor: Colors.grey,
          deleteButtonTooltipMessage: 'Remove this tag',
        ),
      ],
    );
  }

  // 遍历标签
  Widget get _WrapList {
    return Wrap(
      spacing: 8.0,
      children: _tagList.map((item) {
        return Chip(
          label: Text(item),
          deleteButtonTooltipMessage: 'Confirm delete ${item} this tag?',
          onDeleted: () {
            setState(() {
              _tagList.remove(item);
            });
          },
        );
      }).toList(),
    );
  }

  // 遍历动作标签
  Widget get _ActionClipList {
    return Wrap(
      spacing: 8.0,
      children: _tagList.map((item) {
        return ActionChip(
          label: Text(item),
          onPressed: () {
            setState(() {
              _actionTag = item;
            });
          },
        );
      }).toList(),
    );
  }

  // 复选标签
  Widget get _SelectClipList {
    return Wrap(
      spacing: 8.0,
      children: _tagList.map((item) {
        return FilterChip(
          label: Text(item),
          selected: _selectlist.contains(item),
          onSelected: (value) {
            setState(() {
              if (_selectlist.contains(item)) {
                _selectlist.remove(item);
              } else {
                _selectlist.add(item);
              }
            });
          },
        );
      }).toList(),
    );
  }

  // 单选标签
  Widget get _RadioClipList {
    return Wrap(
      spacing: 8.0,
      children: _tagList.map((item) {
        return ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(color: Colors.white),
          selectedColor: Colors.orange,
          backgroundColor: Colors.grey,
          selected: _tagText == item,
          onSelected: (value) {
            setState(() {
              _tagText = item;
            });
          },
        );
      }).toList(),
    );
  }

  // 数据表格
  Widget get _ListViewTables {
    return Container(
      height: 300,
      child: ListView(
        children: <Widget>[
          DataTable(
            sortColumnIndex: _sortColumnIndex, // 排序索引
            sortAscending: _sortColumnFlat, // 排序状态
            // onSelectAll: (bool value) {}, //全选
            columns: [
              DataColumn(
                  label: Text('书名'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortColumnFlat = ascending;
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  }),
              DataColumn(label: Text('作者')),
              DataColumn(label: Text('图片')),
            ],
            rows: posts.map((item) {
              return DataRow(
                  selected: item.selected, // 单选
                  onSelectChanged: (bool value) {
                    // 单选方法
                    setState(() {
                      if (item.selected != value) {
                        item.selected == value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text("${item.title}")),
                    DataCell(Text("${item.author}")),
                    DataCell(Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "${item.imgUrl}",
                        fit: BoxFit.cover,
                      ),
                    )),
                  ]);
            }).toList(),
          )
        ],
      ),
    );
  }

  // 分页数据表格

  final PostDataSource _postDataSoure = PostDataSource();
  Widget get _PaginatedTablesList {
    return Container(
      height: 300,
      child: ListView(
        children: <Widget>[
          PaginatedDataTable(
            header: Text('表格数据'),
            source: _postDataSoure,
            rowsPerPage: 2, // 每页行数
            sortColumnIndex: _sortColumnIndex, // 排序索引
            sortAscending: _sortColumnFlat, // 排序状态
            // onSelectAll: (bool value) {}, //全选
            columns: [
              DataColumn(
                  label: Text('书名'),
                  onSort: (int coumnlIndex, bool ascending) {
                    _postDataSoure._sort(
                        (post) => post.title.length, ascending);
                    setState(() {
                      _sortColumnIndex = coumnlIndex;
                      _sortColumnFlat = ascending;
                    });
                  }),
              DataColumn(label: Text('作者')),
              DataColumn(label: Text('图片')),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小碎片集合(TAG/DIVIDER/WRAP/TABLE...)')),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Wrap(
                spacing: 8.0, // 间隔
                runSpacing: 8.0, // 行与行之间的间隔
                children: <Widget>[
                  Text('基础标签'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    height: 18.0, // 分隔符宽度
                    indent: 10, // 分隔符缩进
                  ),
                  _WrapDemo,
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    height: 18.0, // 分隔符宽度
                    indent: 10, // 分隔符缩进
                  ),
                  // 遍历出来的tag
                  _WrapList,
                  //-----------------------------------
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    height: 18.0, // 分隔符宽度
                    indent: 10, // 分隔符缩进
                  ),
                  Text('动作标签:${_actionTag}'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  _ActionClipList,
                  //-----------------------------------
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  Text('多选标签:${_selectlist.toString()}'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  _SelectClipList,
                  //-----------------------------------
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  Text('单选标签:${_tagText}'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  _RadioClipList,
                  //-----------------------------------
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  Text('数据表格'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  _ListViewTables,
                  //-----------------------------------
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  Text('分页数据表格'),
                  Divider(
                    color: Colors.grey, // 分隔符颜色
                    indent: 10, // 分隔符缩进
                  ),
                  _PaginatedTablesList,
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.restore,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _tagList = ['apple', 'banana', 'orange'];
            _selectlist = [];
            _tagText = 'apple';
          });
        },
      ),
    );
  }
}

// 分页数据表格
class PostDataSource extends DataTableSource {
  @override
  final List<Posts> _posts = posts;
  int _selectedCount = 0;
  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => _selectedCount;
  @override
  DataRow getRow(int index) {
    final Posts post = _posts[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text("${post.title}")),
      DataCell(Text("${post.author}")),
      DataCell(Container(
        padding: EdgeInsets.all(5),
        child: Image.asset(
          "${post.imgUrl}",
          fit: BoxFit.cover,
        ),
      )),
    ]);
  }

  // 排序方法
  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final avalue = getField(a);
      final bvalue = getField(b);

      return Comparable.compare(avalue, bvalue);
    });
    notifyListeners();
  }
}
