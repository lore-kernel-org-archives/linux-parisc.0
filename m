From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] more cpup.c results
Date: Wed, 5 Jan 2005 09:20:45 +0100
Message-ID: <41C96BC400002ED6@mail-1-bnl.tiscali.it>
References: <20050105061613.GA12455@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Grant Grundler" <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050105061613.GA12455@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

> -- Original Message --
> Date: Tue, 4 Jan 2005 23:16:13 -0700
> From: Grant Grundler <grundler@parisc-linux.org>
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] more cpup.c results
> 
> 
> On Tue, Jan 04, 2005 at 10:54:12PM -0700, Grant Grundler wrote:
> > 	add prefetching to copy_user_page_asm
> > 	matches asm now checked into build-tools/cpup.c
> 
[...]
> Which tells me the L1 cache is accessible in 1 cycle on PA8700.
> And if other CPU implementations need 2 cycles, it wouldn't
> hurt to commit the 6regs version.
> 
> Can folks try this on PA8000 and PA82000 for me?
> Check /proc/cpuinfo if you aren't sure what you have.
> 
Unfortunately only pa8600 (n4k and b2k) ...

> Should be a simple cut/paste of 4 lines to a shell prompt:
> 
> gcc -O2 -o cpup0 cpup.c
> gcc -O2 -march=3D2.0 -DLP64 -o cpup2 cpup.c
> gcc -O2 -march=3D2.0 -DLP64 -DUSE6REGS -o cpup3 cpup.c
> for i in 1 2 3 4 5; do echo TEST $i; ./cpup0; ./cpup2; ./cpup3; done
> 
anyway here are some results from a b2k (runing obviously a 2.6.10-pa4 64=
bits):
# for i in 1 2 3 4 5; do echo TEST $i; ./cpup0; ./cpup2; ./cpup3; done
TEST 1
          First Loop : min  14462  avg  17576  median  15409
         Later Loops : min   6628  avg   8597  median   7953
          First Loop : min  10313  avg  13497  median  11727
         Later Loops : min   3581  avg   4843  median   4568
          First Loop : min  10714  avg  13703  median  11897
         Later Loops : min   3630  avg   5033  median   4778
TEST 2
          First Loop : min  14445  avg  17452  median  15428
         Later Loops : min   6616  avg   8605  median   7945
          First Loop : min  10358  avg  13510  median  11755
         Later Loops : min   3597  avg   4835  median   4567
          First Loop : min  10669  avg  13708  median  11885
         Later Loops : min   3618  avg   5034  median   4780
TEST 3
          First Loop : min  14459  avg  17437  median  15432
         Later Loops : min   6621  avg   8592  median   7943
          First Loop : min  10345  avg  13541  median  11732
         Later Loops : min   3584  avg   4853  median   4566
          First Loop : min  10658  avg  13695  median  11879
         Later Loops : min   3637  avg   5032  median   4775
TEST 4
          First Loop : min  14503  avg  17455  median  15429
         Later Loops : min   6605  avg   8595  median   7945
          First Loop : min  10265  avg  13515  median  11740
         Later Loops : min   3566  avg   4835  median   4562
          First Loop : min  10681  avg  13720  median  11886
         Later Loops : min   3651  avg   5035  median   4778
TEST 5
          First Loop : min  14472  avg  17460  median  15425
         Later Loops : min   6627  avg   8590  median   7938
          First Loop : min  10376  avg  13555  median  11742
         Later Loops : min   3597  avg   4843  median   4570
          First Loop : min  10684  avg  13689  median  11891
         Later Loops : min   3663  avg   5027  median   4775

hth,
      Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
