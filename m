From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] ALSA Harmony driver
Date: Mon, 23 May 2005 15:34:51 +0100
Message-ID: <20050523143451.GA2485@ntlworld.com>
References: <20050523105248.4F858494058@palinux.hppa>
	<20050523111554.GA2301@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050523111554.GA2301@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 23, 2005 at 12:15:55PM +0100, Stuart Brady wrote:
> I've not had panics from ALSA Harmony in quite a while.

Oops -- it appears removing the module isn't very reliable, yet.

> The only things missing are simultaneous playback/capture,

I've no idea if this is even possible with ALSA.  (The problem is that
playback and capture must use the same sample rate and format.)

> some mixer settings

I.e. switches for headphones, line-out and internal speaker output,
which I've just committed.   OSS mixer apps (like aumix) won't see
these, but alsamixer works fine.  (Use "m" to toggle.)

ALSA drivers usually mute everything during initialisation.  Unless
anyone has a reason not to, I'm going to make Harmony mute the
headphones, line-out and internal speaker outputs, too.

> and some cleanups for the monitor channel (which most people
> won't care about).  I think it's preferable to the OSS driver, anyway.

OTOH, maybe not if it's built as a module...
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
