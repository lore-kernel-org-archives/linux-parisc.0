Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lawrence.psl-dist.co.uk (unknown [193.129.245.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01491482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 Jan 2002 10:59:11 -0700 (MST)
Message-ID: <3765AD6E3C88D211A92400A0C9A4F70E0119D735@lawrence.psl-dist.co.uk>
From: Graham Donaldson <Graham_Donaldson@psl-dist.co.uk>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 31 Jan 2002 17:59:04 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Graphics support
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

Hi,

	I notice PA-RISC Linux has X11 working now, but I gather that is via
the STI?  Is that correct?  Would that make it pretty slow?

	I just wondered if you could give me any information on the status
of a proper graphics driver for PARISC Linux, it seems HP is being funny
about letting people have the docs for their chipsets maybe?  Also though I
wanted to consider whether use would be made of HP's colour recovery
technology?  From what I have read, currently in HPUX you must compile your
apps to support the Colour Recovery extension.  However, would it be
possible for this to be inbuilt somehow into the XServer when a proper
driver exists for it?  Many of the lower end workstations only have an 8bit
framebuffer but do support Colour Recovery, and with apps like gnome and gtk
making extensive use of high colour graphics, it seems a shame to not use
this probably under utilised HP technology.

Thanks for reading,

Graham Donaldson
Technical Consultant

Email: 	graham_donaldson@psl-dist.co.uk
Tel:      01706 898285
Fax: 	01706 898200

PSL - Partner Services 
'The partner of choice for the provision of quality IT services to UK and
Ireland channel partners'
