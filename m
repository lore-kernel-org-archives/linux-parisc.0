From: Thibaut VARENE <varenet@esiee.fr>
Subject: [parisc-linux] Re: [PATCH] Harmony fixes
Date: Tue, 8 Jun 2004 20:21:19 +0200
Message-ID: <A38D5236-B978-11D8-B143-0030656F07A2@esiee.fr>
References: <20040605184526.GA1317@calypso>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Stuart Brady <sdbrady@ntlworld.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040605184526.GA1317@calypso>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

tested and committed, enjoy.

Le samedi, 5 juin 2004, =E0 20:45 Europe/Paris, Stuart Brady a =E9crit :

> harmony-levellimit.patch:
> Volume levels passed to the MIXER_WRITE ioctls are now limited to 100,
> which prevents bogus levels from interferring with other mixer=20
> channels.
>
> harmony-stereolevels.patch:
> The MIXER_READ ioctls now return a right_level for the monophonic =
mixer
> channels that is the same as the left_level.
>
> harmony-s16le.patch:
> The AFMT_S16_LE format is now rejected, just as all other unsupported
> formats are rejected.  As a result, applications which write =
big-endian
> samples with AFMT_S16_LE format set will no longer work.=

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
