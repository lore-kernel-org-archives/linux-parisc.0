Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58B7F482D
	for <parisc-linux@parisc-linux.org>; Fri, 20 Jun 2003 06:31:55 -0600 (MDT)
Date: Fri, 20 Jun 2003 14:31:52 +0200
Subject: Re: [parisc-linux] KGDB Port first patch release
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20030620121415.GQ24357@parcelfarce.linux.theplanet.co.uk>
Message-Id: <2C12ACFD-A31B-11D7-A94E-0030656F07A2@esiee.fr>
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

Le vendredi, 20 jun 2003, =E0 14:14 Europe/Paris, Matthew Wilcox a =E9crit=
 :

> On Fri, Jun 20, 2003 at 01:43:05PM +0200, Thibaut VAR=C8NE wrote:
>> The patch also adds a "Compile kernel with frame pointer option" and
>> takes care of removing lifimage (created by "make palo") on "make
>> clean".
>> Maybe we want one or both changes to be committed upstream, any=20
>> thought
>> ?
>
> Those two sound generally useful; send patches!
>
committed
