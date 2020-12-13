import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool initialValue,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: initialValue,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _createSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glúten!',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactos!',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições veganas!',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas!',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
