Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA24197
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 15:59:46 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <375EE563.71B06F27@thepuffingroup.com>
Date: Wed, 09 Jun 1999 18:06:27 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Tor Arntsen <tor@spacetec.no>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] build success
References: <199906092126.XAA02287@pallas.spacetec.no>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Tor Arntsen wrote:
> 
> Alex deVries mailed me and said he used the default configs, so I just
> pressed return to all make config questions and hey presto it compiled
> (except for one thing, coming back to that).


Ack.  I'm having problems hitting 'reply all'.

> -#!/bin/bash
> +#!/usr/bin/env bash

I've changed this to /bin/sh, and that's committed now.

- Alex
