{ stdenv
, buildPythonPackage
, fetchPypi
, trezor
, libagent
, ecdsa
, ed25519
, mnemonic
, keepkey
, semver
}:

buildPythonPackage rec{
  pname = "trezor_agent";
  version = "0.10.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e82bf000c1178b1a7612f2a90487eb34c6234d2edb15dc8e310ad875d8298690";
  };

  propagatedBuildInputs = [ trezor libagent ecdsa ed25519 mnemonic keepkey semver ];

  meta = with stdenv.lib; {
    description = "Using Trezor as hardware SSH agent";
    homepage = https://github.com/romanz/trezor-agent;
    license = licenses.gpl3;
    maintainers = with maintainers; [ np ];
  };

}
