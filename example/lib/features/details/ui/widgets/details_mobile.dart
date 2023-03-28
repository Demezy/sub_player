import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'movie_trailer.dart';

class DetailsMobileView extends StatelessWidget {
  const DetailsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: MovieTrailer(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 160,
                      width: 100,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            'Lorem ipsum dolor sit amet',
                            softWrap: true,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 9.4  ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.reviews,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 5.5  ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.change_circle_rounded,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 8.0',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Смотреть'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ReadMoreText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              trimLines: 5,
              colorClickableText: Theme.of(context).primaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\t\t\t▼',
              trimExpandedText: '\t\t\t▲',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '2012 | Россия | 1 сезон\nДрама, Исторический | 12+',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Все о сериале',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Icon(Icons.star_border_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Оценить',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Icon(Icons.bookmark_add_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Смотреть',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Icon(Icons.ios_share_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Поделиться',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Специально для вас',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
