Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA28076
	for <parisc-linux@puffin.external.hp.com>; Sat, 28 Oct 2000 23:59:06 -0600
Date: Sat, 28 Oct 2000 23:00:17 -0700
From: Richard Henderson <rth@cygnus.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Mark Mitchell <mark@codesourcery.com>,
        Grant Grundler <grundler@cup.hp.com>, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com
Subject: Re: __FUNCTION__ broken
Message-ID: <20001028230017.A19583@cygnus.com>
References: <Pine.LNX.4.21.0010281302510.2559-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0010281302510.2559-100000@front.linuxcare.com.au>; from Alan Modra on Sat, Oct 28, 2000 at 01:55:13PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 28, 2000 at 01:55:13PM +1100, Alan Modra wrote:
>        current_function_decl = NULL;
> +      c_function_name_declared_p = 0;

Applied, thanks.



r~
