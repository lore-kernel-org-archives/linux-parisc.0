From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Mon, 9 Oct 2017 18:22:33 -0400
Message-ID: <0253C94D-1566-496F-961B-222A2D6EECFD@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de> <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net> <20171006143917.GA4906@alpha.franken.de> <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net> <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net> <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de> <8A61C252-CA15-44AB-9225-EAA6C259E872@bell.net> <20171009174146.GA21988@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171009174146.GA21988@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-09, at 1:41 PM, Tom Bogendoerfer wrote:

> On Mon, Oct 09, 2017 at 12:30:36PM -0400, John David Anglin wrote:
>> On 2017-10-09, at 11:34 AM, Helge Deller wrote:
>> 
>>> Maybe PDC does not reset (all of?) those registers when it reboots?
>>> If so, maybe it's possible to boot into Linux afterwards and get the registers from there?
>> 
>> Attached is dump from linux after rebooting from hpux.
> 
> thanks, but since firmware will sets all chipset stuff from scratch, there
> is no new information in that dump.

After searching the internet, I don't think there's a way to read these registers from userspace on hpux.
It looks like writing a kernel module is the only way...

Dave
--
John David Anglin	dave.anglin@bell.net



