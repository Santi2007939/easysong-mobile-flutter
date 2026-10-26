import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:easy_song/features/home/infrastructure/song_repository_impl.dart';
import 'package:easy_song/features/home/presentation/home_page.dart';
import 'package:easy_song/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  late final HomeViewModel viewModel;
  late final GetSongsUseCase useCase;
  late final SongRepository repository;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    repository = SongRepositoryImpl();
    useCase = GetSongsUseCase(repository: repository);
    viewModel = HomeViewModel(useCase: useCase);

    pages = [HomePage(viewModel: viewModel), Text("Favorites"), Text("Cart")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
