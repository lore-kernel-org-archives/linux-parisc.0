Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Fri, 13 Sep 2002 18:31:35 +0200." <3D8212E7.6000609@esiee.fr>
References: <3D8212E7.6000609@esiee.fr> 
Date: Fri, 13 Sep 2002 13:09:29 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020913190929.8F8084829@dsl2.external.hp.com>
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

Thibaut VARENE wrote:
> Now I'm asking you to know if anybody has an objection against making 
> SYM2 the default driver in debian-configs instead of old SYM1.

I don't. All the boxes I care about have 53c8xx chips in them.

A slightly safer approach is to make sym2 the default for PA2.0 systems
and the old sym the default for PA1.1 systems. But GSC/HSC c720 cards
don't fit that model since they go into systems with either sub-arch.
I don't see a way around users "tuning" based on actual HW configuration.

grant
