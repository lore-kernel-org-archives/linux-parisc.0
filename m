Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FC1D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 06:36:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18wMh6-0005up-Tc; Fri, 21 Mar 2003 13:36:24 +0000
Date: Fri, 21 Mar 2003 13:36:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030321133624.GK14520@parcelfarce.linux.theplanet.co.uk>
References: <200303201823.h2KINN1w007420@hiauly1.hia.nrc.ca> <3E689FC400004CD8@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E689FC400004CD8@ocpmta1.freegates.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Mar 21, 2003 at 01:44:28PM +0100, Joel Soete wrote:
> I test following work-around against 2.4.20-pa32 with latest dpkg gcc-3.3
> (3.3-0pre2) and it boot well know:
> @@ -489,7 +489,11 @@
> +#if !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__
> >= 1))
> +		if (ka->sa.sa_handler == (void *)SIG_IGN) {
> +#else
>  		if (ka->sa.sa_handler == SIG_IGN) {
> +#endif

ugh, this is foolish.  You should be doing:

-		if (ka->sa.sa_handler == SIG_IGN) {
+		if (ka->sa.sa_handler == (void *)SIG_IGN) {

no ifdefs!

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
