import java.lang.Float;


public class TestExchange2
{
	public static void printArr(Float[] arr)
	{
		System.out.print("{");
		for(int i = 0; i < arr.length; i++)
		{
			System.out.print(arr[i]);
			System.out.print(", ");
		}
		System.out.println("}");
	}

	public static void main(String[] args)
	{
		Float[] arr = { 1.0f, 1.1f, 1.2f, 1.3f, 1.4f, 1.5f, 1.6f, 1.7f, 1.8f, 1.9f };

		printArr(arr);

		UtilMethodGenerics.<Float>exchange(arr, 2, 9);
		
		printArr(arr);
		
	}

}
