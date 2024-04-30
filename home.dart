import 'package:flutter/material.dart';


void main() {
  runApp(InicioScreen());
}

class Profesional {
  final String nombreNegocio;
  final String categoria;
  final String subcategoria;
  final double estrellas;
  final double cobro;
  final double distancia;
  final int trabajos;

  Profesional({
    required this.nombreNegocio,
    required this.categoria,
    required this.subcategoria,
    required this.estrellas,
    required this.cobro,
    required this.distancia,
    required this.trabajos,
  });
}

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  double _currentSliderValue = 3;
  List<Profesional> profesionales = [
    Profesional(
      nombreNegocio: "Herrajes Ixtapaluca",
      categoria: "Hogar",
      subcategoria: "Diseño",
      estrellas: 4.1,
      cobro: 4.5,
      distancia: 2.3,
      trabajos: 7,
    ),
    Profesional(
      nombreNegocio: "Carpintería, aluminio y mantenimiento gral 'Serrano'",
      categoria: "Hogar",
      subcategoria: "Diseño",
      estrellas: 5.0,
      cobro: 4.8,
      distancia: 4.9,
      trabajos: 8,
    ),
    Profesional(
      nombreNegocio: "Plomeria 'Ortiz'",
      categoria: "Hogar",
      subcategoria: "Reparaciones",
      estrellas: 1.0,
      cobro: 1.0,
      distancia: 1.0,
      trabajos: 1,
    ),
    Profesional(
      nombreNegocio: "Plomería y electricidad Jorge Garcia",
      categoria: "Hogar",
      subcategoria: "Reparaciones",
      estrellas: 5,
      cobro: 4.0,
      distancia: 1.0,
      trabajos: 1,
    ),
    Profesional(
      nombreNegocio: "Albañil en Ixtapaluca",
      categoria: "Hogar",
      subcategoria: "Construccion",
      estrellas: 2.3,
      cobro: 2.5,
      distancia: 2.0,
      trabajos: 3,
    ),
  ];

  List<Profesional> profesionalesFiltrados = [];

  String _selectedPuntuacion = 'Mayor a menor';
  String _selectedCobro = 'Más barato';

  @override
  void initState() {
    super.initState();
    profesionalesFiltrados = List.from(profesionales);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/user_profile_image.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Uziel Sandoval',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('@uziel.sando'),
                onTap: () {
                  // Acción para mostrar el nombre de usuario
                },
              ),
              ListTile(
                title: Text('uziel.sando@hotmail.com'),
                onTap: () {
                  // Acción para mostrar el correo
                },
              ),
              ListTile(
                title: Text('Configuración'),
                onTap: () {
                  // Acción para abrir la pantalla de configuración
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Categorías'),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: Text('Construcción'),
                onTap: () {
                  // Acción para filtrar por categoría 1
                },
              ),
              ListTile(
                title: Text('Muebles y accesorios'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
              ListTile(
                title: Text('Electrodomesticos'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
              ListTile(
                title: Text('Salud y belleza'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
              ListTile(
                title: Text('Limpieza'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
              ListTile(
                title: Text('Niños y educación'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
              ListTile(
                title: Text('Mascotas'),
                onTap: () {
                  // Acción para filtrar por categoría 2
                },
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Buscar profesionales',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      showSettingsBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: profesionalesFiltrados.length,
                itemBuilder: (context, index) {
                  final profesional = profesionalesFiltrados[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/profile_image.jpg'),
                      ),
                      title: Text(
                        profesional.nombreNegocio,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Categoria: ${profesional.categoria}'),
                          Text('Subcategoria: ${profesional.subcategoria}'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text('${profesional.estrellas}'),
                              SizedBox(width: 10),
                              Icon(Icons.attach_money, color: Colors.green),
                              Text('${profesional.cobro}'),
                              SizedBox(width: 10),
                              Text('${profesional.distancia} km'),
                            ],
                          ),
                          Text('Trabajos: ${profesional.trabajos}'),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Theme.of(context).primaryColor),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Mensajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Contratos',
            ),
          ],
        ),
      ),
    );
  }

  void showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text('Radio de distancia'),
                subtitle: Slider(
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                  value: _currentSliderValue, // Valor inicial
                ),
                trailing: Text(
                    '${_currentSliderValue.toInt()} km'), // Mostrar el número de km seleccionado
              ),
              ListTile(
                title: Text('Puntuación'),
                trailing: DropdownButton<String>(
                  value: _selectedPuntuacion,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPuntuacion = newValue!;
                      // Aquí puedes filtrar los profesionales según la opción seleccionada
                    });
                  },
                  items: <String>['Mayor a menor', 'Menor a mayor']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                title: Text('Cobro'),
                trailing: DropdownButton<String>(
                  value: _selectedCobro,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCobro = newValue!;
                      // Aquí puedes filtrar los profesionales según la opción seleccionada
                    });
                  },
                  items: <String>['Más barato', 'Más caro'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
