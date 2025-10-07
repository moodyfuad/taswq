// home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:taswq/features/product/controllers/home_controller.dart';
import 'package:taswq/localization/string_keys.dart';
import 'package:taswq/utils/constants/asset_images.dart';
import 'package:taswq/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController c = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(XStringKeys.appName.tr, style: Get.textTheme.displayLarge),

        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30),
            onPressed: c.onSearchTap,
          ),
        ],
        leading: IconButton(
          icon: Icon(IconsaxPlusBold.shopping_cart, size: 30),
          onPressed: c.onCartTap,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // تحديث البيانات
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Banner
              SizedBox(
                height: width * 0.45,
                child: PageView(
                  children: [
                    Image.asset(XAssetImages.homeBanner, fit: BoxFit.cover),
                    Image.asset(XAssetImages.homeBanner, fit: BoxFit.cover),
                    // المزيد...
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Search + Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'ابحث عن منتجات أو فئة',
                    prefixIcon: Icon(IconsaxPlusBroken.search_normal_1),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategoryChip('ملابس'),
                    _buildCategoryChip('أحذية'),
                    _buildCategoryChip('إكسسوارات'),
                    _buildCategoryChip('الجمال'),
                    // المزيد...
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Flash Sale Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'عروض سريعة',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(width: 8),
                    Obx(() {
                      final sec = c.flashRemaining.value;
                      final minutes = sec ~/ 60;
                      final seconds = sec % 60;
                      return Text(
                        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                        style: Get.textTheme.displayLarge,
                      );
                    }),
                    const Spacer(),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'عرض الكل',
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: XColors.electricMagenta,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: width * 0.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productCardPlaceholder(),
                    _productCardPlaceholder(),
                    _productCardPlaceholder(),
                    _productCardPlaceholder(),
                    _productCardPlaceholder(),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // New Arrivals Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'وصل حديثًا',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  4,
                  (index) => _productCardPlaceholder(),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: XColors.lumenIndigo,
        selectedIconTheme: IconThemeData(
          // fill: 1,
          color: XColors.electricMagenta,
        ),

        currentIndex: 0,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBroken.home_2,
              size: 30,
              color: XColors.secondaryText,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBroken.category,
              size: 30,
              color: XColors.secondaryText,
            ),
            label: 'الفئات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBroken.heart,
              size: 30,
              color: XColors.secondaryText,
            ),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBroken.profile,
              size: 30,
              color: XColors.secondaryText,
            ),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title, style: Get.textTheme.bodyMedium),
        elevation: 2,
        backgroundColor: XColors.paperLight,
      ),
    );
  }

  Widget _productCardPlaceholder() {
    return GestureDetector(
      onTap: () {
        c.onProductTap();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 140,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              bottom: BorderSide(color: XColors.primaryText, width: 2),
            ),
            // border: Border.all(color: XColors.primaryText, width: 2),
          ),
          decoration: BoxDecoration(color: XColors.onPrimaryText),

          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(0),
                  color: Colors.grey.shade300,
                  child: Image.asset(
                    XAssetImages.homeBanner,
                    fit: BoxFit.cover,
                    alignment: AlignmentGeometry.centerLeft,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('منتج', textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
