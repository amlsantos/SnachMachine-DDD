﻿#region

using FluentAssertions;
using Logic.SharedKernel;
using Xunit;

#endregion

namespace UnitTests;

public class MoneySpecs
{
    [Fact]
    public void Sum_of_two_moneys_produces_correct_result()
    {
        // arrange
        var money1 = new Money(1, 2, 3, 4, 5, 6);
        var money2 = new Money(1, 2, 3, 4, 5, 6);

        // act
        var sum = money1 + money2;

        // assert
        sum.OneCentCount.Should().Be(2);
        sum.TenCentCount.Should().Be(4);
        sum.QuarterCentCount.Should().Be(6);
        sum.OneDollarCount.Should().Be(8);
        sum.FiveDollarCount.Should().Be(10);
        sum.TwentyDollarCount.Should().Be(12);
    }

    [Fact]
    public void Two_money_instances_equal_if_contain_the_same_amount()
    {
        // arrange & act
        var money1 = new Money(1, 2, 3, 4, 5, 6);
        var money2 = new Money(1, 2, 3, 4, 5, 6);

        // assert
        money1.Should().Be(money2);
        money1.GetHashCode().Should().Be(money2.GetHashCode());
    }

    [Fact]
    public void Two_money_instances_do_not_equal_if_different_money_amount()
    {
        // arrange & act
        var dollar = new Money(0, 0, 0, 1, 0, 0);
        var hundredCents = new Money(100, 0, 0, 0, 0, 0);

        // assert
        dollar.Should().NotBe(hundredCents);
        dollar.GetHashCode().Should().NotBe(hundredCents.GetHashCode());
    }

    [Theory]
    [InlineData(-1, 0, 0, 0, 0, 0)]
    [InlineData(0, -2, 0, 0, 0, 0)]
    [InlineData(0, 0, -3, 0, 0, 0)]
    [InlineData(0, 0, 0, -4, 0, 0)]
    [InlineData(0, 0, 0, 0, -5, 0)]
    [InlineData(0, 0, 0, 0, 0, -6)]
    public void Cannot_create_money_with_negative_value(int oneCentCount, int tenCentCount, int quarterCentCount,
        int oneDollarCount, int fiveDollarCount, int twentyDollarCount)
    {
        // arrange & act
        var action = () => new Money(oneCentCount, tenCentCount, quarterCentCount, oneDollarCount, fiveDollarCount,
            twentyDollarCount);

        // assert
        action.Should().Throw<InvalidOperationException>();
    }

    [Theory]
    [InlineData(0, 0, 0, 0, 0, 0, 0)]
    [InlineData(1, 0, 0, 0, 0, 0, 0.01)]
    [InlineData(1, 2, 0, 0, 0, 0, 0.21)]
    [InlineData(1, 2, 3, 0, 0, 0, 0.96)]
    [InlineData(1, 2, 3, 4, 0, 0, 4.96)]
    [InlineData(1, 2, 3, 4, 5, 0, 29.96)]
    [InlineData(1, 2, 3, 4, 5, 6, 149.96)]
    [InlineData(11, 0, 0, 0, 0, 0, 0.11)]
    [InlineData(110, 0, 0, 0, 100, 0, 501.1)]
    public void Amount_is_calculated_correctly(int oneCentCount, int tenCentCount, int quarterCount, int oneDollarCount,
        int fiveDollarCount, int twentyDollarCount, decimal expectedAmount)
    {
        // arrange & act
        var money = new Money(oneCentCount, tenCentCount, quarterCount, oneDollarCount, fiveDollarCount,
            twentyDollarCount);

        // assert
        money.Amount.Should().Be(expectedAmount);
    }

    [Fact]
    public void Subtraction_of_two_moneys_produces_correct_result()
    {
        // arrange
        var money1 = new Money(10, 10, 10, 10, 10, 10);
        var money2 = new Money(1, 2, 3, 4, 5, 6);

        // act
        var result = money1 - money2;

        result.OneCentCount.Should().Be(9);
        result.TenCentCount.Should().Be(8);
        result.QuarterCentCount.Should().Be(7);
        result.OneDollarCount.Should().Be(6);
        result.FiveDollarCount.Should().Be(5);
        result.TwentyDollarCount.Should().Be(4);
    }

    [Fact]
    public void Subtraction_cannot_subtract_money_count_more_than_exists()
    {
        // arrange
        var tenCents = new Money(0, 1, 0, 0, 0, 0); // 0-1 =-1
        var oneCent = new Money(1, 0, 0, 0, 0, 0);

        // act
        var subtraction = () => tenCents - oneCent;

        // assert
        subtraction.Should().Throw<InvalidOperationException>();
    }
}