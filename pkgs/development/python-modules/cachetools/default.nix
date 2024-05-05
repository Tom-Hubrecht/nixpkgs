{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder

# build-system
, setuptools

# tests
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "cachetools";
  version = "5.3.3";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "tkem";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-G+TkS6NsaiPGzNLk3DbBH8D1yLM8bFVLtHioNcIZMHw=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "cachetools"
  ];

  meta = with lib; {
    description = "Extensible memoizing collections and decorators";
    homepage = "https://github.com/tkem/cachetools";
    changelog = "https://github.com/tkem/cachetools/blob/v${version}/CHANGELOG.rst";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
