Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D31D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 08:59:04 -0700 (MST)
Date: Sun, 26 Jan 2003 16:58:54 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: max@avtlg.ru
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot warning 80F5.
Message-Id: <20030126165854.42e05146.varenet@esiee.fr>
In-Reply-To: <3E340091.2000003@avtlg.ru>
References: <3E340091.2000003@avtlg.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sun, 26 Jan 2003 18:36:49 +0300
"Max" <max@avtlg.ru> wrote:

> Hi,
> 
>     I have HP 9000/809/k100. When my box boot from Debian 3.0r1 hppa CD
> ( Interact with IPL (Y or N)?> Y ), i've got message "Cannot find ENTRY
> TEST Status= -4" and WARN 80F5 on LCD panel status. What is that means?
> What do I do?
> Where can I find other WARN description ?
Read the PA/Linux boot HOWTO
http://pateam.esiee.fr/doc.html

and search the mailing-list for K-class PDC console issues
http://www.fr.parisc-linux.org/mailing-lists/

The message you see can be the result of several problems.

Most likely the kernel shipped with 3.0r1 doesn't support K's MUX.

You'll need a '-PDC-' image from
http://pateam.esiee.fr/cd-images/testing/

see http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017846.html


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
