Return-Path: <hppa-linux@puffingroup.com>
Message-ID: <31AC914701CCD111900700805FE655DBCD1F69@xch-mes-02.msc.az.boeing.com>
From: "Werzyn, Ed" <Ed.Werzyn@ARZ.Boeing.com>
To: "'hppa-linux@puffingroup.com'" <hppa-linux@puffingroup.com>
Date: Wed, 10 Feb 1999 15:49:42 -0700
MIME-Version: 1.0
Content-Type: text/plain
Subject: [hppa-linux] Nevermind...  Got multiuser mode running
Resent-Message-ID: <"Pv6gc3.0.hl2.CVYms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Like usual, play around enough and you'll figure it out.  Changed inittab
initdefault from 1 to 3 and it comes up in multiuser mode (just like it says
so in inittab - DOH!).  

Sorry for the chaff   ;-)


Ed Werzyn
System Administrator
Longbow Apache Helicopter Software
Boeing - Mesa

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
