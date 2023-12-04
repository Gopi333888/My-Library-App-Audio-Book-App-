import 'package:hive/hive.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';

final data = <Map<String, String>>[
  {
    'book': 'The Jungle book',
    'author': 'Rudyard Kipling',
    'description':
        """The Jungle Book is a classic children's novel written by Rudyard Kipling, first published in 1891. The story follows a young Indian boy named Mowgli, who is abandoned by his parents and raised in a jungle by wolves. As he grows up, he must navigate the dangers of the jungle, including dangerous animals, while trying to find his place in the world. The novel explores themes of identity, family, and survival, and is loved by readers of all ages for its thrilling adventure and memorable characters.""",
    'aboutAuthor':
        """The Jungle Book is a novel written by Rudyard Kipling, published in 1891. Kipling was an English author and poet, known for his works of literature that reflect the British colonial experience and the natural world. The Jungle Book is a coming-of-age story that follows a young boy named Mowgli as he grows up in the jungle with a pack of wolves. The novel is filled with adventure, exotic creatures, and lessons about the importance of friendship and the dangers of prejudice and intolerance.


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/The%20jungle%20book%2Fjunglebookthe-01-kipling-AudioTr.mp3?alt=media&token=8e7e8c10-f44f-489d-9951-85250a1d30b4',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/The%20jungle%20book%2Fjungle%20book.jpg?alt=media&token=76a0bac3-3225-4270-b439-a02ab984696b',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/The%20jungle%20book%2FRudyard_Kipling%20junglebk.jpg?alt=media&token=81d0b7e9-d0e2-44ed-9b5b-d4e91031ec2a',
    'category': 'Adventure'
  },
  {
    'book': 'Journey to the Center of the Earth',
    'author': 'Rudyard Kipling',
    'description':
        """ "Journey to the Center of the Earth" is a novel written by Jules Verne, published in 1865. The story follows the journey of a group of scientists who travel to the center of the Earth despite warnings from others about the dangers of the journey. The characters face various challenges as they descend through the Earth's layers, including a lack of air, extreme heat, and pressure from the weight of the Earth above them. Eventually, the group reaches the core of the earth and discovers a world unlike anything they have ever seen before. The novel is considered a classic of science fiction and is credited with inspiring the creation of contemporary science fictionfare.  """,
    'aboutAuthor':
        """Jules Verne is a famous French author known for his imaginative and detailed descriptions of fantastical voyages and inventions. In his works, Verne helped to create the concept of science fiction, using scientific theories and new technologies to inspire his stories. Some of his most famous novels include "20,000 Leagues Under the Sea," "Around the World in 80 Days," and "Journey to the Center of the Earth." Through his descriptions, Verne imagines incredible landscapes, historical settings, and technological marvels, inspiring generations of writers and thinkers.


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/MahaBhrath%2Fdrhackensawssecrets-02-fezandie.mp3?alt=media&token=223233a7-ee6e-4d48-84e4-9e031286010f',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/MahaBhrath%2Fjourney-to-the-center-of-the-earth-57.jpg?alt=media&token=b65069cc-faab-46fa-ac43-42ba39f14772',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/MahaBhrath%2Fauthor%20tjtcoe.jpg?alt=media&token=015b3bd8-16d0-4139-8a7b-eb4a4c98ddc1',
    'category': 'Adventure'
  },
  {
    'book': 'The Mysterious Island',
    'author': 'Jules Verne',
    'description':
        """ "The Mysterious Island" is a novel by Jules Verne, published in 1872. It tells the story of a group of adventurers who set sail on a journey to find a legendary island known for its treasure, but encounter many obstacles and intrigues along the way. The book is considered a classic of science fiction and adventure literature, and has been adapted into numerous film and TV adaptations. """,
    'aboutAuthor':
        """Jules Verne is a famous French author known for his imaginative and detailed descriptions of fantastical voyages and inventions. In his works, Verne helped to create the concept of science fiction, using scientific theories and new technologies to inspire his stories. Some of his most famous novels include "20,000 Leagues Under the Sea," "Around the World in 80 Days," and "Journey to the Center of the Earth." Through his descriptions, Verne imagines incredible landscapes, historical settings, and technological marvels, inspiring generations of writers and thinkers.


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mysteriousIsland%2Fmysteriousisland-01-verne-AudioT.mp3?alt=media&token=1e6f3819-fbfa-4c30-b19a-1c43a3f4b445',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mysteriousIsland%2Fmysterious%20Island.webp?alt=media&token=fa58aa9b-9cf9-412b-8921-88f301b59dac',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mysteriousIsland%2Fauthor%20tjtcoe.jpg?alt=media&token=2a743a81-8fcc-4643-be0b-9fa71420bf42',
    'category': 'Adventure'
  },
  {
    'book': 'Sense and Sensibility',
    'author': 'Jane Austen',
    'description':
        """ “Sense and Sensibility” is a novel written by British author Jane Austen, published in 1811. It follows the story of two sisters, Elinor and Marianne Dashwood, and their romantic pursuits during the early 19th century in England. Set in the rural countryside of Devonshire, the novel explores themes of love, marriage, social class, and the importance of virtuous sensibilities. It is considered one of Austen’s greatest works and a classic of English literature. """,
    'aboutAuthor':
        """ Jane Austen (1775-1817) was an English novelist whose works include Pride and Prejudice, Sense and Sensibility, and Emma. Her novels are known for their realistic stories of courtship and marriage in the British upper classes during the late 18th and early 19th centuries. Austen's novels often feature strong, intelligent women as protagonists and explore social issues such as class, gender, and status.  


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Sence%20%26%20Sencibility%2Fsense_and_sensibility_01_austen-%5BAudioTrimmer.com%5D.mp3?alt=media&token=087804eb-2baa-4a4c-bd2c-39b06d085b18',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Sence%20%26%20Sencibility%2Fs%20%26%20s.webp?alt=media&token=d44220c6-0ffe-44fe-a5fa-7906dbe992b9',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Sence%20%26%20Sencibility%2FS%20%26%20s%20author.webp?alt=media&token=b8b2fd60-c28d-4a29-92be-f2802657c4d0',
    'category': 'Novel'
  },
  {
    'book': 'Far from the Madding Crowd',
    'author': 'Thomas Hardy',
    'description':
        """ "Far from the Madding Crowd" is a novel by Thomas Hardy, published in 1874. It follows the life of a young farmer namedthurin who becomes infatuated with a woman named Tess Duryer and their ultimately tragic relationship. The book explores themes of love, desire, social class, and the consequences of one's actions. Hardy's writing style is characterized by its use of language and imagery to convey the emotions and experiences of his characters. """,
    'aboutAuthor':
        """ Thomas Hardy was an English writer, best known for his novels set in Wessex, such as "Far From the Madding Crowd," "Tess of the D'Urbervilles," and "The Return of the Prodigal Son." He is also known for his poetry and short stories. Hardy's writing is characterized by its dark realism and social commentary, and he is considered one of the greatest authors of the Victorian period. Another notable work by Thomas Hardy is "Jude the Obscure."


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/far%20from%20the%20madding%20crowd%2Ffarfromthemaddingcrowd-01-thomas.mp3?alt=media&token=76c58cb2-60e3-42cf-9bc8-10905a39c5b4',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/far%20from%20the%20madding%20crowd%2Fmaddin%20crowd%203.jpg?alt=media&token=4ffb1dc7-cc5d-4d74-b8c5-a554172a0d63',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/far%20from%20the%20madding%20crowd%2Fmadding%20crowd%202.jpeg?alt=media&token=e7805a0f-5be0-43c2-af7c-e37dfa7acbc8',
    'category': 'Novel'
  },
  {
    'book': 'Mahabharat',
    'author': 'Vyasa',
    'description':
        """  Mahabharat is a Sanskrit epic attributed to Vyasa, the Hindu text historian. The story revolves around two sets of cousins - the Pandava and Kaurava princes - who struggle for power and revenge. Some of the largest epics in Hindu literature, including the Bhagavad Gita and the Yoga Sutras, are found within the Mahabharat. With its rich characters and moral lessons, Mahabharat provides a timeless insight into life, duty, and righteousness. The book was originally written in verse and is a fundamental part of Hindu culture and tradition.  """,
    'aboutAuthor':
        """ Vyasa was one of the greatest ancient Indian philosophers and sage associated with the Vedas, Upanishads, and Bhagavad Gita. He is best known as the author of the Yoga Sutras, a foundational text in Hindu yoga philosophy. The Yoga Sutras teach the path to self-realization and inner peace through the practice of yoga, by systematically exploring the nature of consciousness, perception, habit, action, and spiritual realization. In addition to the Yoga Sutras, Vyasa is also known for his commentaries on other sacred texts, including the Mahabharata and Puranas."


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mahabharath%201%2Fmahabharata-02-romeshdutt-AudioT.mp3?alt=media&token=9a699ea4-4f27-471e-92cd-9473c9e1d55a',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mahabharath%201%2Fmahabharath.jpg?alt=media&token=b4e2c4e6-c457-4775-9990-52bc89a18cd7',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/mahabharath%201%2Fmahabharath%201.jpg?alt=media&token=b4795527-ce8b-43eb-bfc2-ae38c58573f7',
    'category': 'Novel'
  },
  {
    'book': 'Pride and Prejudice ',
    'author': 'Jane Austen ',
    'description':
        """  Pride and Prejudice is a romantic novel written by Jane Austen and first published in 1813. It follows the lives of the wealthy Bennet family and the romantic tension between the proud Mr. Darcy and the spirited Elizabeth Bennet. The novel is considered one of Austen's greatest works and is loved for its witty dialogue, sharp social commentary, and timeless themes of love and social class. If you're interested in reading Pride and Prejudice, it is widely available in bookstores and online retailers, and has also been adapted into numerous film and television adaptations.   """,
    'aboutAuthor':
        """Jane Austen (1775-1817) was an English novelist whose works include Pride and Prejudice, Sense and Sensibility, and Emma. Her novels are known for their realistic stories of courtship and marriage in the British upper classes during the late 18th and early 19th centuries. Austen's novels often feature strong, intelligent women as protagonists and explore social issues such as class, gender, and status. "


""",
    'audio':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Pride%20and%20Prejudice%2Fprideandprejudice_01_austen-%5BAudioTrimmer.com%5D.mp3?alt=media&token=ddb5c2eb-e5f3-422a-bc9c-5c7730bd29e7',
    'cover':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Pride%20and%20Prejudice%2Fpride%20and%20P.jpg?alt=media&token=7c693857-8379-441f-b4cf-02db998918c1',
    'authorImage':
        'https://firebasestorage.googleapis.com/v0/b/mylibraryflutter-3455f.appspot.com/o/Pride%20and%20Prejudice%2FS%20%26%20s%20author.webp?alt=media&token=0af9dec6-4f9d-4bc3-9ed1-56182910a9bb',
    'category': 'Novel'
  }
];

Future<void> addDataInitaly() async {
  final db = await Hive.openBox<BookModel>('books_db');
  if (db.isEmpty) {
    for (var map in data) {
      final model = BookModel(
          bookName: map['book']!,
          author: map['author']!,
          audioUrl: map['audio']!,
          imageUrl: map['cover']!,
          bookDetails: map['description']!,
          authorDetails: map['aboutAuthor']!,
          authorimageUrl: map['authorImage']!,
          favoriteUserIds: [],
          categories: map['category']!);
      await db.add(model);
    }
  }
}
