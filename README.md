## Verticellis
- This is a responsive self-hosted comics template generator aimed to be as easy as possible to host new issues
- Here is a [live example](http://podcastdequadrinhos.com.br/testmtxr/index.html) of a generated website with two issues

## Requirements
- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

## How to Use
- Download this repository
- Create a new folder at public/ with the name of your comic (like the examples)
- Upload your pages numbered (i.e.: 1.jpg, 2.jpg)
- Change the filme manifest.json with each comic information, for add new ones just add a comma to after the close curly bracket
  ```
        "title": "Example #1",
        "author": "Daniel Sousa",
        "author_url": "http://twitter.com/bomdiavermes",
        "number_of_pages": 3,
        "folder": "example-comic-01",
        "image_format": "jpg",
        "url_slug": "example-01",
        "previous_chapter_url_slug": "",
        "next_chapter_url_slug": "example-02"
  ```
- `author`, `author_url`, `previous_chapter_url_slug` and `next_chapter_url_slug` are optional

- Run the script: `ruby src/main.rb`
  - [How to run a ruby script](https://www.thoughtco.com/using-the-command-line-2908368)
- Upload the files generated inside the public folder to your website server
- Your can tweak the base HTML at `src/base.html` and the styles at `public/base.css`

## Acknowledgments
- Example Comic are some pages from the amazing Daniel Sousa, [check out his work](http://twitter.com/bomdiasvermes)!
- This entire idea came from Warren Ellis' (hence the terrible project name) Newsletter, [subscribe to it](http://orbitaloperations.com/)!
