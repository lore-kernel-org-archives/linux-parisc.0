Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id D553D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 06:39:37 -0600 (MDT)
Message-ID: <3ED8A2B4.4030904@bluehash.de>
Date: Sat, 31 May 2003 14:40:20 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: Jaime Ash <ja@lachivaquemada.com>,
	parisc-linux@lists.parisc-linux.org
References: <NEBBJAILOLAHGDBEOCIOCEECDHAA.ja@lachivaquemada.com>
In-Reply-To: <NEBBJAILOLAHGDBEOCIOCEECDHAA.ja@lachivaquemada.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Re: Trouble trying to start gdm
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

Hello,

which graphicscard of your 715/100 are you using? The built-in one has a 
color depth of  only  8bit. So you has to change the 
"defaultdepth"-entry in your XF86Config-4 accordingly.

Ruediger
