Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82C724829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Apr 2003 08:54:59 -0600 (MDT)
Date: Tue, 8 Apr 2003 07:52:10 -0700
From: Randolph Chung <randolph@tausq.org>
To: bruno_vidal@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New dump driver patche.
Message-ID: <20030408145210.GD12993@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <03Apr8.130336cest.119063@ns.hiscom.nl> <3E92C42E.5B9BB871@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E92C42E.5B9BB871@hp.com>
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

> Joel asked for something interresting, does someone know how I can retrieve an option
> passed to the kernel ? I never try it ? In which driver I need to look at ? If I can
> add some option, I'll be able for example to do an early dump in case
> of crash before multi user, and then before dump initialisation.

look up the MODULE_PARM() macro. It's used in many drivers.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
