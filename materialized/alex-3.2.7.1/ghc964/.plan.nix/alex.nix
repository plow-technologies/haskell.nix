{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "alex"; version = "3.2.7.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) Chis Dornan, Simon Marlow";
      maintainer = "Simon Marlow <marlowsd@gmail.com>";
      author = "Chris Dornan and Simon Marlow";
      homepage = "http://www.haskell.org/alex/";
      url = "";
      synopsis = "Alex is a tool for generating lexical analysers in Haskell";
      description = "Alex is a tool for generating lexical analysers in Haskell.\nIt takes a description of tokens based on regular\nexpressions and generates a Haskell module containing code\nfor scanning text efficiently. It is similar to the tool\nlex or flex for C/C++.";
      buildType = "Simple";
      isLocal = true;
      detailLevel = "FullDetails";
      licenseFiles = [ "LICENSE" ];
      dataDir = "data/";
      dataFiles = [ "AlexTemplate.hs" "AlexWrappers.hs" ];
      extraSrcFiles = [
        "CHANGELOG.md"
        "README.md"
        "TODO"
        "doc/Makefile"
        "doc/aclocal.m4"
        "doc/alex.1.in"
        "doc/alex.xml"
        "doc/config.mk.in"
        "doc/configure.ac"
        "doc/docbook-xml.mk"
        "doc/fptools.css"
        "examples/Makefile"
        "examples/Tokens.x"
        "examples/Tokens_gscan.x"
        "examples/Tokens_posn.x"
        "examples/examples.x"
        "examples/haskell.x"
        "examples/lit.x"
        "examples/pp.x"
        "examples/state.x"
        "examples/tiny.y"
        "examples/words.x"
        "examples/words_monad.x"
        "examples/words_posn.x"
        "src/Parser.y.boot"
        "src/Scan.x.boot"
        "src/ghc_hooks.c"
        "tests/Makefile"
        "tests/simple.x"
        "tests/null.x"
        "tests/tokens.x"
        "tests/tokens_gscan.x"
        "tests/tokens_posn.x"
        "tests/tokens_bytestring.x"
        "tests/tokens_posn_bytestring.x"
        "tests/tokens_scan_user.x"
        "tests/tokens_strict_bytestring.x"
        "tests/tokens_monad_bytestring.x"
        "tests/tokens_monadUserState_bytestring.x"
        "tests/tokens_bytestring_unicode.x"
        "tests/basic_typeclass.x"
        "tests/basic_typeclass_bytestring.x"
        "tests/default_typeclass.x"
        "tests/gscan_typeclass.x"
        "tests/posn_typeclass.x"
        "tests/monad_typeclass.x"
        "tests/monad_typeclass_bytestring.x"
        "tests/monadUserState_typeclass.x"
        "tests/monadUserState_typeclass_bytestring.x"
        "tests/posn_typeclass_bytestring.x"
        "tests/strict_typeclass.x"
        "tests/unicode.x"
        "tests/issue_71.x"
        "tests/issue_119.x"
        "tests/issue_141.x"
        "tests/issue_197.x"
      ];
      extraTmpFiles = [];
      extraDocFiles = [];
    };
    components = {
      exes = {
        "alex" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
          buildable = true;
          modules = [
            "AbsSyn"
            "CharSet"
            "DFA"
            "DFAMin"
            "DFS"
            "Info"
            "Map"
            "NFA"
            "Output"
            "Paths_alex"
            "Parser"
            "ParseMonad"
            "Scan"
            "Set"
            "Sort"
            "Util"
            "UTF8"
            "Data/Ranged"
            "Data/Ranged/Boundaries"
            "Data/Ranged/RangedSet"
            "Data/Ranged/Ranges"
          ];
          hsSourceDirs = [ "src" ];
          mainPath = [ "Main.hs" ];
        };
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.alex.components.exes.alex or (pkgs.pkgsBuildBuild.alex or (errorHandler.buildToolDepError "alex:alex")))
          ];
          buildable = true;
          mainPath = [ "test.hs" ];
        };
      };
    };
  } // rec { src = pkgs.lib.mkDefault ../.; }