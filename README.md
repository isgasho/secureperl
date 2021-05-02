<p align="center">
  <p align="center">SECUREPERL</p>
  <p align="center">A static analyzer for Perl Language write in pure Perl.</p>
  <p align="center">
    <a href="/LICENSE.md">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg">
    </a>
  </p>
</p>

---

### Summary

"Static program analysis is the analysis of computer software that is performed without actually executing programs, in contrast with dynamic analysis, which is analysis performed on programs while they are executing."[[1]](#references)

"Perl::Critic is an extensible framework for creating and applying coding standards to Perl source code. Essentially, it is a static source code analysis engine. Perl::Critic is distributed with a number of Perl::Critic::Policy modules that attempt to enforce various coding guidelines. Most Policy modules are based on Damian Conway's book Perl Best Practices. However, Perl::Critic is not limited to PBP and will even support Policies that contradict Conway. You can enable, disable, and customize those Polices through the Perl::Critic interface. You can also create new Policy modules that suit your own tastes."[[2]](#references)

So, secureperl is an extension of Perl::Critic that allows anyone to use it anywhere - mainly with Github Actions-, this project is just a study PoC.

---

### Download and install

```bash
# Download
$ git clone https://github.com/htrgouvea/secureperl && cd secureperl
    
# Install libs and dependencies
$ sudo cpan install Perl::Critic Path::Iterator::Rule
```
---

### Example of use

```
# Define a source code as a target
$ perl secureperl.pl ../nozaki 
    
[-] ../nozaki/nozaki.pl
[+] Two-argument "open" used at line 69, column 13. See page 207 of PBP.
            
[-] ../nozaki/lib/Engine/Fuzzer.pm
[+] Code before strictures are enabled at line 7, column 5. See page 429 of PBP.
            
[-] ../nozaki/lib/Engine/Parser.pm
[+] Package declaration must match filename at line 1, column 1. Correct the filename or package statement.
[+] Code before strictures are enabled at line 6, column 5. See page 429 of PBP.
            
[-] ../nozaki/lib/Functions/Helper.pm
[+] Code before strictures are enabled at line 5, column 2. See page 429 of PBP.
```
---

### Using with Github Actions

```yaml
name: secureperl
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v1
    - name: Audit code
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
      run: |
        sudo apt install -y libpath-iterator-rule-perl libtest-perl-critic-perl 
        curl -s https://raw.githubusercontent.com/htrgouvea/secureperl/main/secureperl.pl | perl
```

---

### Contribution

- Your contributions and suggestions are heartily ♥ welcome. [See here the contribution guidelines.](/.github/CONTRIBUTING.md) Please, report bugs via [issues page](https://github.com/htrgouvea/nipe/issues) and for security issues, see here the [security policy.](/SECURITY.md) (✿ ◕‿◕) This project follows the best practices defined by this [style guide](https://heitorgouvea.me/projects/perl-style-guide).

---

### License

- This work is licensed under [MIT License.](/LICENSE.md)

---

### References

1. [https://en.wikipedia.org/wiki/Static_program_analysis](https://en.wikipedia.org/wiki/Static_program_analysis)
2. [https://metacpan.org/pod/Perl::Critic](https://metacpan.org/pod/Perl::Critic)