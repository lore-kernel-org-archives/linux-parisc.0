Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.fachschaften.tu-muenchen.de (hermes.fachschaften.tu-muenchen.de [129.187.176.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 58E35482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 03:47:41 -0700 (MST)
Date: Mon, 14 Jan 2002 11:47:16 +0100 (CET)
From: Andreas Deresch <aderesch@fs.tum.de>
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: sid vs woody (was 715/50)
In-Reply-To: <20020113220723.673A7482A@dsl2.external.hp.com>
Message-ID: <Pine.NEB.4.40.0201141140140.29083-100000@io.fachschaften.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> For the adventerous, edit the /etc/apt/sources.list to point
          ~~~~~~~~~~~
> to "sid" like this:
>
> deb http://http.us.debian.org/debian sid main contrib non-free
> deb http://non-us.debian.org/debian-non-US sid/non-US main contrib non-free
Shouldn't one use stable, testing and unstable, which are of course at the
moment linked to potato, woody and sid respectively? Otherwise you will stay
with sid even when it is declared stable (or unavailable) - and you don't
want that, do you?  ;-)

ad
