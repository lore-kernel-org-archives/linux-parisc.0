From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] more cpup.c results
Date: Tue, 4 Jan 2005 23:16:13 -0700
Message-ID: <20050105061613.GA12455@colo.lackof.org>
References: <20050105055412.68E06495698@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050105055412.68E06495698@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 04, 2005 at 10:54:12PM -0700, Grant Grundler wrote:
> 	add prefetching to copy_user_page_asm
> 	matches asm now checked into build-tools/cpup.c

I committed a new version of copy_user_page_asm based on
the results of build-tools/cpup.c.

Here's the output from the last set of cpup2 (4regs) run:
grundler <577>while :; do ./cpup2; done
          First Loop : min   9247  avg  12037  median  11250
         Later Loops : min   5568  avg   7006  median   6906
          First Loop : min   9180  avg  12051  median  11244
         Later Loops : min   5557  avg   7003  median   6904
          First Loop : min   9204  avg  12027  median  11239
         Later Loops : min   5556  avg   7002  median   6901
          First Loop : min   9197  avg  12032  median  11237
         Later Loops : min   5546  avg   6996  median   6901
          First Loop : min   9300  avg  12032  median  11225
         Later Loops : min   5584  avg   7001  median   6901

It's essentially indistiguishable from cpup3 (6 regs) routine:
grundler <579>while :; do ./cpup3; done
          First Loop : min   9188  avg  11992  median  11223
         Later Loops : min   5493  avg   7002  median   6874
          First Loop : min   9213  avg  11988  median  11224
         Later Loops : min   5487  avg   7004  median   6873
          First Loop : min   9252  avg  11991  median  11204
         Later Loops : min   5487  avg   7004  median   6874
          First Loop : min   9228  avg  12021  median  11219
         Later Loops : min   5550  avg   7003  median   6879
          First Loop : min   9200  avg  11994  median  11215
         Later Loops : min   5514  avg   6997  median   6874

Which tells me the L1 cache is accessible in 1 cycle on PA8700.
And if other CPU implementations need 2 cycles, it wouldn't
hurt to commit the 6regs version.

Can folks try this on PA8000 and PA82000 for me?
Check /proc/cpuinfo if you aren't sure what you have.

Should be a simple cut/paste of 4 lines to a shell prompt:

gcc -O2 -o cpup0 cpup.c
gcc -O2 -march=2.0 -DLP64 -o cpup2 cpup.c
gcc -O2 -march=2.0 -DLP64 -DUSE6REGS -o cpup3 cpup.c
for i in 1 2 3 4 5; do echo TEST $i; ./cpup0; ./cpup2; ./cpup3; done

Please post the output to the mailing list along with /proc/cpuinfo.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
