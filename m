Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BCC14849
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 08:52:22 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail14.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 17 Jun 2002 14:52:20 -0000
Date: Mon, 17 Jun 2002 08:00:08 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mke2fs odd number:
Message-ID: <20020617150008.GB4540@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020617095042.GE1177@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020617095042.GE1177@tykepenguin.com>
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

In reference to a message from Patrick Caulfield, dated Jun 17:
> Does anyone else get with from mke2fs:
> 
> This filesystem will be automatically checked every 22 mounts or
> 1.23076e-312 days, whichever comes first.  Use tune2fs -c or -i to override.
> 
> I really hope it doesn't want to check the filesystem that often :)

yes, i've seen that many times in the past. my guess it's one of the
not-yet-fixed floating-point/varargs problems, but i haven't really
looked.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
