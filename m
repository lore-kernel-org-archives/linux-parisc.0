From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] libseccomp/tests: Report if test was skipped
 because of missing valgrind
Date: Mon, 18 Apr 2016 18:37:28 -0400
Message-ID: <1765217.3d9ZDVQ0iE@sifl>
References: <20160213200731.GA18161@ls3530.box> <571103AD.20500@gmx.de> <20160415150941.GA11180@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>, Mike Frysinger <vapier@gentoo.org>
To: libseccomp@googlegroups.com
Return-path: <libseccomp+bncBD4NPLXYE4IKVQ6VXACRUBDASMM5G@googlegroups.com>
In-Reply-To: <20160415150941.GA11180@ls3530.dhcp.wdf.sap.corp>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

On Friday, April 15, 2016 05:09:41 PM Helge Deller wrote:
> Print a message if a regression test was skipped just because valgrind isn't
> installed.
> 
> This additional info is useful for architectures (e.g. parisc) which aren't
> as fast as x86_64. On parisc it seemed that the whole testcase was hanging,
> now people know what's actually happening.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Merged, thanks!

> diff --git a/tests/regression b/tests/regression
> index 53d26b2..5949459 100755
> --- a/tests/regression
> +++ b/tests/regression
> @@ -772,6 +773,7 @@ function run_test() {
>  		if check_deps valgrind; then
>  			run_test_bpf_valgrind "$testnumstr" "$3"
>  		else
> +			print_result $testnumstr "SKIPPED" "(valgrind not installed)"
>  			stats_skipped=$(($stats_skipped+1))
>  		fi
>  	elif [[ "$4" == "live" ]]; then

-- 
paul moore
www.paul-moore.com

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
