From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony - improved recording source toggling
Date: Thu, 27 May 2004 23:02:23 +0100
Message-ID: <20040527220223.GA2653@calypso>
References: <20040527150933.GB612@calypso>
	<20040527151731.633A93658BE@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="d6Gm4EdcadzBjdND"
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040527151731.633A93658BE@mail.esiee.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch improves toggling of the recording source between the MIC and
LINE channels.  It does not depend on the channel names patch.

Cheers,
-- 
Stuart Brady

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="harmony-mixer-recmask.diff"

--- drivers/sound/harmony.c.orig	2004-05-25 23:21:52.000000000 +0100
+++ drivers/sound/harmony.c	2004-05-27 21:44:18.000000000 +0100
@@ -981,11 +981,15 @@
 {
 	int new_input_line;
 	int new_input_mask;
--d6Gm4EdcadzBjdND--
