Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 21 Jan 2002 18:45:27 +0100." <3C4C53B7.67DA24E@admin.france.hp.com>
References: <3C4C53B7.67DA24E@admin.france.hp.com> 
Date: Mon, 21 Jan 2002 13:25:39 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020121202539.994A5482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> As I said few days ago, I've a dump driver ready.
> Now I'm working on a savecrash command. It works fine
> for the dump, but I need to save with the dump some
> informations like the running kernel at dump time.

Bruno - this is great!


> So in the dump I've got this informations:
> utsname_release and utsname_version. Now, how can
> I found the right kernel in /boot ? In other
> word, how can I retrieve utsname informations in a
> binary file (without system.map and gdb) ?

A couple of ideas/hacks:
o assume it's /boot/System.map + /boot/vmlinux. Tell people if they
  want to use dump/savecrash, that's what they have to do.

o assume it's in /boot. Use fgrep to find the matching strings.
  Something like
	#!/bin/sh
	cd /boot
	for i in *
	do
		fgrep $1 $i > /dev/null 2>&1
		if [ $? -eq 0 ]
		then
			echo $i
			exit 0
		fi
	done
	exit 1

The case that /boot might not be mounted could cause problems.

Since klogd seems to want System.map, perhaps savecrash could use
the same heuristics to find the "right" System.map.
See Documentation/oops-tracing.txt for more details.

hth,
grant
