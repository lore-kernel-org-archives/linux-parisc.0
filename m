Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id E32144829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 08:06:53 -0600 (MDT)
Date: Tue, 6 May 2003 07:04:25 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030506140425.GF18309@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030505200537.GF29544@tausq.org> <3EB6425400000488@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EB6425400000488@ocpmta7.freegates.net>
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

> AFAIK here is the full patch I suggested after some mail exchanges with Dave:
> 

I think willy already mentioned that:

> +#if !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__
> >= 1))
> +		if (ka->sa.sa_handler == (void *)SIG_IGN) {
> +#else
>  		if (ka->sa.sa_handler == SIG_IGN) {
> +#endif

is wrong.. just do

> +		if (ka->sa.sa_handler == (void *)SIG_IGN) {

unconditionally. don't put the ifdef's in.

can you post a cleaned up patch?

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
