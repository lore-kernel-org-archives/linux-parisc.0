From: Joe Perches <joe@perches.com>
Subject: Re: [RFC][PATCH v2 7/7] checkpatch: add pF/pf deprecation warning
Date: Wed, 20 Sep 2017 10:38:58 -0700
Message-ID: <1505929138.12311.5.camel@perches.com>
References: <20170920162910.32053-1-sergey.senozhatsky@gmail.com>
         <20170920162910.32053-8-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Andy Whitcroft <apw@canonical.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170920162910.32053-8-sergey.senozhatsky@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2017-09-21 at 01:29 +0900, Sergey Senozhatsky wrote:
> We deprecated '%pF/%pf' printk specifiers, since '%pS/%ps' is now smart
> enough to handle function pointer dereference on platforms where such
> dereference is required.
> 
> checkpatch warning example:
> 
> WARNING: Use '%pS/%ps' instead. This pointer extension was deprecated: '%pF'

If this series is accepted,  I think this message
is unclear and would prefer something like:
---
scripts/checkpatch.pl | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index dd2c262aebbf..71f3273d5913 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5762,18 +5762,25 @@ sub process {
 		        for (my $count = $linenr; $count <= $lc; $count++) {
 				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
 				$fmt =~ s/%%//g;
-				if ($fmt =~ /(\%[\*\d\.]*p(?![\WFfSsBKRraEhMmIiUDdgVCbGNO]).)/) {
+				if ($fmt =~ /(\%[\*\d\.]*p(?![\WSsBKRraEhMmIiUDdgVCbGNO]).)/) {
 					$bad_extension = $1;
 					last;
 				}
 			}
 			if ($bad_extension ne "") {
 				my $stat_real = raw_line($linenr, 0);
+				my $ext_type = "Invalid";
+				my $use = "";
 				for (my $count = $linenr + 1; $count <= $lc; $count++) {
 					$stat_real = $stat_real . "\n" . raw_line($count, 0);
 				}
+				if ($bad_extension =~ /p[Ff]/i) {
+					$ext_type = "Deprecated";
+					$use = " - use %pS instead";
+					$use =~ s/pS/ps/ if ($bad_extension =~ /pf/);
+				}
 				WARN("VSPRINTF_POINTER_EXTENSION",
-				     "Invalid vsprintf pointer extension '$bad_extension'\n" . "$here\n$stat_real\n");
+				     "$ext_type vsprintf pointer extension '$bad_extension'$use\n" . "$here\n$stat_real\n");
 			}
 		}
 
