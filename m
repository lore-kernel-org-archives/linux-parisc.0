From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 21:52:05 +0000
Message-ID: <20050320215205.GA17959__20006.5220975832$1416623705$gmane$org@ntlworld.com>
References: <200503191959.05972.dmp@davidmpye.dyndns.org> <200503201918.31808.dmp@davidmpye.dyndns.org> <20050320204032.3ed40468@Tatooine.r3z0> <200503201952.31465.dmp@davidmpye.dyndns.org> <20050320210357.53534d01@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050320210357.53534d01@Tatooine.r3z0>
Resent-Message-ID: <DMNZ5D.A._ZH.G_ePCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sun, Mar 20, 2005 at 09:03:57PM +0100, Thibaut VARENE wrote:
> it's not that simple.
> If you want to have it gone, add 
> @reboot echo "" > /proc/pdc/lcd
> in your root crontab :)

BTW, If anyone really wants scrolling, this script should do it.  It has
to use character 16 for spaces, which is a bit broken -- YMMV.

====================
#!/bin/bash

STR="Linux $(uname -r)   "
END=""

# Prevent the PDC from stripping leading spaces by
# using character 16 (octal 20) as a space...

STR="$(echo "$STR" | tr ' ' '\20')"

while(true); do
	echo "${STR}${END}" > /proc/pdc/lcd
	END="${END}${STR:0:1}"
	STR="${STR:1}"
	if [ -z "${STR:-}" ]; then
		STR="${END}"
		END=""
	fi
	sleep 0.25
done
====================

The character set is interesting:

1-8 for the disk/network/heartbeat symbols
32-127 are the standard ascii characters, except that:
   92 is a yen symbol
  126 is a left arrow
  127 is a right arrow
128-159 are unused
160-254 seem to be a mix of japanese, greek and accented roman letters
240 is an empty box
255 is a filled in square

Hope that helps,
-- 
Stuart Brady


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
