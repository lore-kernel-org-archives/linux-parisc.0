Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E85AB4850
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 04:17:59 -0700 (MST)
Date: Fri, 15 Feb 2002 12:17:57 +0100
Subject: Re: [parisc-linux] Power LED 
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v480)
Cc: <parisc-linux@lists.parisc-linux.org>
To: "James S" <smith-james@home.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk>
Message-Id: <A9FF8C1C-2205-11D6-90EC-0030656F07A2@esiee.fr>
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

>>> what causes the power led to go out on the 712 systems ?
>>> is it software controlled ?
>>
>> I don't think so.
>> The power button is under software control but I think
>> the LED is wired to the power supply directly.
>>
>> grant
>
> was just wondering - mine goes out after the system starts loading - 
> flashes
> before that
>
> when it had hp-ux on it, it stayed on

We had the same problem here, and we solved it as follow:

When in Boot Admin, check the 'chassis' command.
We suppose that Chassis Codes must be turned 'on' so that the LED does 
not go out after booting.


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
