Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id B56B1482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 02:35:16 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6F990B00C; Wed,  7 Nov 2001 09:36:17 +0000 (GMT)
Date: Wed, 7 Nov 2001 09:36:17 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011107093617.R8938@linuxcare.com>
References: <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain> <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk> <20011106161613.M8938@linuxcare.com> <20011106192447.O8938@linuxcare.com> <20011106215128.B5797@dogbert.localdomain> <20011107003802.A6253@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011107003802.A6253@dogbert.localdomain>; from fullung@ilink.nis.za on Wed, Nov 07, 2001 at 12:38:02AM +0200
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

On Wed, Nov 07, 2001 at 12:38:02AM +0200, Albert Strasheim wrote:
> after cron. The getty perhaps? What needs to get configured here to make
> it work with serial console?

Enable the relevant line in /etc/inittab, something like

T0:23:respawn:/sbin/getty -L ttyS0 9600 vt100

and add ttyS0 to /etc/securetty to enable root logins.

Richard
