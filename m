From: Helge Deller <deller@gmx.de>
Subject: [PATCH] libseccomp/tests: Report if test was skipped
 because of missing valgrind
Date: Fri, 15 Apr 2016 17:09:41 +0200
Message-ID: <20160415150941.GA11180@ls3530.dhcp.wdf.sap.corp>
References: <20160213200731.GA18161@ls3530.box>
 <3673666.V2ZqGazvLY@sifl>
 <56C24911.8000200@gmx.de>
 <1907254.cBdVSxntFv@sifl>
 <20160409070549.GA5442@ls3530.box>
 <CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
 <571103AD.20500@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Paul Moore <paul@paul-moore.com>, libseccomp@googlegroups.com,
	Mike Frysinger <vapier@gentoo.org>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <libseccomp+bncBC23VB5X54DBBPUIYS4AKGQEAJDOX4A@googlegroups.com>
In-Reply-To: <571103AD.20500@gmx.de>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

Print a message if a regression test was skipped just because valgrind isn't
installed.

This additional info is useful for architectures (e.g. parisc) which aren't as
fast as x86_64. On parisc it seemed that the whole testcase was hanging, now
people know what's actually happening.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/tests/regression b/tests/regression
index 53d26b2..5949459 100755
--- a/tests/regression
+++ b/tests/regression
@@ -772,6 +773,7 @@ function run_test() {
 		if check_deps valgrind; then
 			run_test_bpf_valgrind "$testnumstr" "$3"
 		else
+			print_result $testnumstr "SKIPPED" "(valgrind not installed)"
 			stats_skipped=$(($stats_skipped+1))
 		fi
 	elif [[ "$4" == "live" ]]; then

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
