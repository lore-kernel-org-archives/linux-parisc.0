Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver1.hrz.tu-darmstadt.de (mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CCAA482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jan 2002 16:54:03 -0700 (MST)
Received: from fb04281.mathematik.tu-darmstadt.de (fb04281.mathematik.tu-darmstadt.de [130.83.2.21])
	by mailserver1.hrz.tu-darmstadt.de (8.9.1a/8.9.1) with ESMTP id AAA29249
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Jan 2002 00:39:09 +0100 (MET)
Received: from fb0482.mathematik.tu-darmstadt.de (dummy82.mathematik.tu-darmstadt.de [130.83.2.82])
	by fb04281.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA15342
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Jan 2002 00:53:59 +0100
Received: (from grothe@localhost)
	by fb0482.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) id AAA05450
	for parisc-linux@lists.parisc-linux.org; Tue, 8 Jan 2002 00:53:59 +0100
From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Date: Tue, 8 Jan 2002 00:53:59 +0100
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] good news on the 755/125
Message-ID: <20020108005359.A5443@mathematik.tu-darmstadt.de>
References: <a05100301b85fb0ad081c@[129.64.46.83]>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <a05100301b85fb0ad081c@[129.64.46.83]>; from aaronm@cs.brandeis.edu.ml.to on Mon, Jan 07, 2002 at 03:10:38PM -0500
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

On Mon, Jan 07, 2002 at 03:10:38PM -0500, Aaron Macks wrote:
> installed and all is working well(it'c currently compiling LAM and 
> ssh).  two problems:
>   it didn't seem to install the termcap.h file, and I'm not sure where 
> to find it
>   on things which use highliting in curses(dselect) the highliting 
> does not appear

$ dpkg -S /usr/include/termcap.h
libncurses5-dev: /usr/include/termcap.h

Holger
-- 
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
