Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id B030A482E
	for <parisc-linux@parisc-linux.org>; Thu,  7 Aug 2003 11:11:50 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp1.fc.hp.com [15.15.136.127])
	by atlrel8.hp.com (Postfix) with ESMTP id 4C6371C00AA8
	for <parisc-linux@parisc-linux.org>; Thu,  7 Aug 2003 13:11:50 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.11.146.30])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 04E9638117
	for <parisc-linux@parisc-linux.org>; Thu,  7 Aug 2003 11:11:50 -0600 (MDT)
From: bame@hp.com
Reply-To: bame@hp.com
To: bame@ldl.fc.hp.com (Paul Bame)
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 -> 2.6 tree switch tomorrow 
In-Reply-To: Message from bame@ldl.fc.hp.com (Paul Bame)
   of "Wed, 06 Aug 2003 12:48:26 MDT." <20030806184826.GA11934@ldl.fc.hp.com>
References: <20030806184826.GA11934@ldl.fc.hp.com> 
Date: Thu, 07 Aug 2003 11:11:48 -0600
Message-Id: <20030807171149.B2A7A7306A@fc.hp.com>
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

The linux-2.6 tree is now ready for business and the linux-2.5 tree is
frozen.  Tarball (which could be used to seed a CVS tree) and patch
at the usual place:

    http://cvs.parisc-linux.org/download/linux-2.6/

FYI We are using a different CVS branch architecture which should be
completely transparent most of the time.  I'll get a description of
it out soon.

Autobuilt kernels to follow at some point.  FYI the 2.4 autobuilder
is currently off line.

	-P
