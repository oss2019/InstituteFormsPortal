# Contributing to InstituteFormsPortal

Contributions make the open-source community such an amazing place to
learn, inspire, and create. Any contributions you make are **greatly
appreciated**.

There are many ways in which you can contribute to this repository, which can be broadly split into two major parts.
1. Non-Code Part: Updating documentation, writing wiki, making video tutorials, designing assets and UI/UX interface. You can find issues to work on here at [non-code-contributions](https://github.com/oss2019/InstituteFormsPortal/issues?q=is%3Aissue+is%3Aopen+label%3A%22non+code+contribution%22).
2. Coding Part: This includes directly interacting with the code and solving [Issues](https://github.com/oss2019/InstituteFormsPortal/issues).

## Finding what to do
- If you are new to the project, then the issues labelled with the [**Good First Issue**](https://github.com/oss2019/InstituteFormsPortal/labels/good%20first%20issue) label are the right place for you to start with. These will help you understand the codebase by implementing small features.

- If you are an experienced developer, you can go to the [**Issues**](https://github.com/oss2019/InstituteFormsPortal/issues) and start picking up the issues you like.

- Some general guidelines to keep in mind while picking up the issues are the following
  - Do not start coding up stuff by yourself. The PRs associated with an issue are much more likely to be accepted than PRs not related to any issue.
  - Make sure to check if there is already any PR that is associated with the issue that you want to work on in the [Pull Requests](https://github.com/oss2019/InstituteFormsPortal/pulls) section. Some problems might still need to be closed even after merging the PRs. Check whether the PRs are merged or not of the issue you want to work on.

## What after choosing an Issue to work on?
You need to comment on the issue that you are up to take that issue and wait for the repository manager to assign you the issue. You can use the 
[Interested To Work](/#) template to comment on the issue you are interested in working on.

Once the mantainer assignes you with the task, then you can start working on it. Make sure to adhere to the [JS Best Practices](https://code.tutsplus.com/24-javascript-best-practices-for-beginners--net-5399t) in order to maintain uniformity in the code. PRs in which code does not adhere to the best practices might not be merged.

## How to submit a PR
Once you are done writing the code, then you can proceed to submit the PR. You will be prompted to fill up a `Pull Request Template` in order for the mantainer to know what all is there in the PR.

Follow the guide given below to start with the project on your end.

## Developing

If you are interested in deploying the website using docker, then,
```sh
git clone https://github.com/oss2019/InstituteFormsPortal.git --depth 1
cd InstituteFormsPortal
docker build -t InstituteFormsPortal:<some_name> --build-arg DATABASE_URL=<portgres_database_url> .
docker run -d --rm -p 3000:3000 InstituteFormsPortal:<name_you_have_given_up>
```

Others can start with:
```sh
git clone https://github.com/oss2019/InstituteFormsPortal.git
cd InstituteFormsPortal
cp .env.example .env
```

Open the .env file in any editor and place a local or remote(from Supabase) PostgreSQL database URL in there.
Now run,
```
npm install
npm prisma push
npm prisma generate
```
Now your database setup is complete, execute `npm run dev` to start the development preview.
